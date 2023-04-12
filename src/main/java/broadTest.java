import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.SendResult;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;
 
@ServerEndpoint("/broadcasting")
public class broadTest {
    private static Map<String,Session> clients = Collections.synchronizedMap(new HashMap<String,Session>());
    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
    	
    	Gson gson = new Gson();
    	Message message2 = gson.fromJson(message, Message.class);

        synchronized(clients) {
        	if(clients.containsKey(message2.getReciever())) {
        		clients.get(message2.getReciever()).getBasicRemote().sendText(message);
        	}
        	
        	//여기는 db에 메세지 저장작업이 들어가면 됨
        }
    }
    
    @OnOpen
    public void onOpen(Session session) {
        System.out.println(session);
        String otherUser=session.getRequestParameterMap().get("oid").get(0);
        String user=session.getRequestParameterMap().get("id").get(0);
        clients.put(user,session);
        
        System.out.println("onOpen에서 본인: "+user);
        System.out.println("onOpen에서 상대: "+otherUser);
    }
    
    @OnClose
    public void onClose(Session session) {
        clients.remove(session);
    }
}

class Message{
	private String sender;
	private String reciever;
	private String message;
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReciever() {
		return reciever;
	}
	public void setReciever(String reciever) {
		this.reciever = reciever;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	@Override
	public String toString() {
		return "Message [sender=" + sender + ", reciever=" + reciever + ", message=" + message + "]";
	}
	
	
}