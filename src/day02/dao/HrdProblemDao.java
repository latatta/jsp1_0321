package day02.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import day01.OracleConnectUtil;
import day02.vo.Member;
import day02.vo.SaleSum;

public class HrdProblemDao {
	private static HrdProblemDao hrdproblemDao = new HrdProblemDao();
	
	private HrdProblemDao() {	}
	
	public static HrdProblemDao getHrdProblemDao() {
		return hrdproblemDao;
	}

	Connection conn = OracleConnectUtil.connect();
	PreparedStatement pstmt;
	
	// 회원 insert	: insert
	public void insert(Member vo) {
		String sql =  "INSERT INTO IDEV.MEMBER_TBL_02" + 
				"(CUSTNO, CUSTNAME, PHONE, ADDRESS, JOINDATE, GRADE, CITY)" + 
				"VALUES(member_seq.nextval, ?, ?, ?, sysdate, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setNString(2, vo.getCustName());
			pstmt.setNString(3, vo.getPhone());
			pstmt.setNString(4, vo.getAddress());
			pstmt.setNString(6, vo.getGrade());
			pstmt.setNString(7, vo.getCity());
			
			pstmt.execute();
			System.out.println("회원이 등록되었습니다.");
			pstmt.close();
			
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류 : " + e.getMessage());
		}
		OracleConnectUtil.close(conn);
	}
	
	// 회원 update	: update
	public void update(Member vo) {
		String sql = "UPDATE IDEV.MEMBER_TBL_02" + 
				"SET PHONE=?, ADDRESS=?, CITY=?" + 
				"WHERE CUSTNO=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setNString(1, vo.getPhone());
			pstmt.setNString(1, vo.getAddress());
			pstmt.setNString(1, vo.getCity());
			pstmt.setInt(1, vo.getCustNo());
			
			pstmt.execute();
			System.out.println("회원정보 변경이 완료되었습니다.");
			pstmt.close();
			
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류 : " + e.getMessage());
		}
		OracleConnectUtil.close(conn);
	}
	
	// 회원 delete
	// 데이터의 삭제는 대체로 기본키값을 조건으로 삭제합니다. -> 기본키값을 메소드 인자로 합니다.
	public void delete(int custNo) {
		Connection conn = OracleConnectUtil.connect();
		String sql = "delete from member_tbl_02 where custno = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			// 매개변수 전달
			pstmt.setInt(1, custNo);
			pstmt.execute();
			pstmt.close();
			System.out.println("삭제가 완료되었습니다.");
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류 : " + e.getMessage());
		}
		OracleConnectUtil.close(conn);
	}
	
	// 회원 selectAll	: selectMemberAll
	public List<Member> selectAll() {
		String sql = "SELECT * FROM IDEV.MEMBER_TBL_02";
		ResultSet rs = null;
		List<Member> members = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				members.add(new Member(rs.getInt(1), 
								rs.getNString(2), 
								rs.getNString(3), 
								rs.getNString(4), 
								rs.getDate(5), 
								rs.getNString(6), 
								rs.getNString(7)));
			}
			
			pstmt.close();
			
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류 : " + e.getMessage());
		}
		OracleConnectUtil.close(conn);
		return members;
	}
	
	// 회원 selectOne	: selectMember
	public Member selectMember() {
		String sql = "SELECT * FROM MEMBER_TBL_02 mt WHERE CUSTNO = ?";
		ResultSet rs = null;
		Member vo = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				vo = new Member();
				vo.setCustNo(rs.getInt(1));
				vo.setCustName(rs.getNString(2));
				vo.setPhone(rs.getString(3));
				vo.setAddress(rs.getNString(4));
				vo.setJoinDate(rs.getDate(5));
				vo.setGrade(rs.getNString(6));
				vo.setCity(rs.getNString(7));
			}
			
			pstmt.close();
			
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류 : " + e.getMessage());
		}
		OracleConnectUtil.close(conn);
		return vo;
	}
	
	// 매출집계 select	: selectSale
	public List<SaleSum> selectSale() {
		String sql = "Select mt.custno, custname," + 
				" decode(grade, 'A', 'VIP', 'B', '일반', 'C', '직원') AS agrade," + 
				" asum FROM MEMBER_TBL_02 mt ," + 
				" (SELECT CUSTNO, sum(price) AS asum FROM MONEY_TBL_02 mt2" + 
				" GROUP BY CUSTNO" + 
				" ORDER BY asum DESC) sale" + 
				" WHERE mt.CUSTNO = sale.custno order by custno";
		List<SaleSum> salesums = new ArrayList<>();
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				salesums.add(new SaleSum(rs.getInt(1),
									rs.getString(2),
									rs.getNString(3),
									rs.getInt(4)));
			}
			
			
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류 : " + e.getMessage());
		}
		return salesums;
		
	}
	
}
