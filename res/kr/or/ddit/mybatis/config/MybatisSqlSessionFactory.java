package kr.or.ddit.mybatis.config;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/**
 * myBatis의 환경설정 파일(mybatis-config.xml)을 읽어와서 실행한다.
 * SqlSession객체를 반환하는 메서드를 갖는 클래스
 * 
 * @author PC-26
 *
 */
public class MybatisSqlSessionFactory {
	private static SqlSessionFactory sqlSessionFactory= null;
	
	static {
		Reader rd = null;

		try {
			rd = Resources.getResourceAsReader("kr/or/ddit/mybatis/config/mybatis-config.xml");
			sqlSessionFactory=new SqlSessionFactoryBuilder().build(rd);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("mybatis 초기화 실패");
			e.printStackTrace();
		}finally {
			if(rd!=null) {
				try {
					rd.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		
		
		}
	
	public static SqlSessionFactory getSessionFactory() {
		
		return sqlSessionFactory;
	}
	public static SqlSession getSqlSession() {
		
		SqlSession session = sqlSessionFactory.openSession();
		return session;
		
	}
	
}
