package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import day01.OracleConnectUtil;
import vo.HrdMember;

public class HrdMemberDao {
	private static HrdMemberDao dao = new HrdMemberDao();
	private HrdMemberDao() {	}
	public static HrdMemberDao getInstance() {
		return dao;
	}
	
	public void insert(HrdMember vo) {
		Connection conn = OracleConnectUtil.connect();
		PreparedStatement pstmt = null;
		/*
		 * String sql = "INSERT INTO IDEV.MEMBER_TBL_02" +
		 * "(CUSTNO, CUSTNAME, PHONE, ADDRESS, JOINDATE, GRADE, CITY)" +
		 * "VALUES(MEMBER_seq.nextval, ?, ?, ?, sysdate, ?, ?)";
		 */
		String sql = "INSERT INTO IDEV.MEMBER_TBL_02" +
				"(CUSTNO, CUSTNAME, PHONE, ADDRESS, JOINDATE, GRADE, CITY)" +
				"VALUES(?, ?, ?, ?, sysdate, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setNString(2, vo.getCustName());
			pstmt.setNString(3, vo.getPhone());
			pstmt.setNString(4, vo.getAddr());
			pstmt.setNString(5, vo.getGrade());
			pstmt.setNString(6, vo.getCity());
			pstmt.setInt(1, vo.getCustNo());
			
			pstmt.execute();
			System.out.println("회원등록이 완료되었습니다.");
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println("HrdMember 실행 오류 : " + e.getMessage());
		}
		OracleConnectUtil.close(conn);
	}
	
	public int getNextSeq() {
		Connection conn = OracleConnectUtil.connect();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql="select member_seq.nextval from dual";
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				result = rs.getInt(1);
			}
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("HrdMemberDao next seq 오류 : " + e.getMessage());
		}
		OracleConnectUtil.close(conn);
		return result;
		
	}
	// 회원정보 수정 : phone, address, city 컬럼만 수정하고 조건은 기본키 값입니다.
	public void update(HrdMember vo) {
		Connection conn = OracleConnectUtil.connect();
		PreparedStatement pstmt = null;
		String sql =  "UPDATE IDEV.MEMBER_TBL_02 SET PHONE=?, ADDRESS=?, CITY=? WHERE CUSTNO=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
	
			pstmt.setString(1, vo.getPhone());
			pstmt.setNString(2, vo.getAddr());
			pstmt.setNString(3, vo.getCity());
			pstmt.setInt(4, vo.getCustNo());
			
			pstmt.execute();
			System.out.println("회원정보 변경이 완료되었습니다.");
			pstmt.close();
			
		} catch (SQLException e) {
			System.out.println("HrdMemberDao 실행 오류 : " + e.getMessage());
		}
		OracleConnectUtil.close(conn);
	}
	
	public HrdMember selectOne(int custNo) {	// 기본키 값으로 조회
		Connection conn = OracleConnectUtil.connect();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = "select * from member_tbl_02 where custno = ?";
		HrdMember result = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, custNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = new HrdMember(rs.getInt(1), 
										rs.getNString(2),
										rs.getNString(3),
										rs.getNString(4),
										rs.getDate(5),
										rs.getNString(6),
										rs.getNString(7));
			pstmt.close();
			}
		} catch (SQLException e) {
			System.out.println("HrdMemDao selectOne 오류 : " + e.getMessage());
		}
		OracleConnectUtil.close(conn);
		return result;

	}
	
	public List<HrdMember> selectAll() {
		Connection conn = OracleConnectUtil.connect();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = "select * from member_tbl_02";
		List<HrdMember> list = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				list.add(new HrdMember(rs.getInt(1), 
										rs.getNString(2),
										rs.getNString(3),
										rs.getNString(4),
										rs.getDate(5),
										rs.getNString(6),
										rs.getNString(7)));
			}
			
		} catch (SQLException e) {
			System.out.println("HrdMemberDao selectAll : " + e.getMessage());
		}
		OracleConnectUtil.close(conn);
		return list;
	}
}
