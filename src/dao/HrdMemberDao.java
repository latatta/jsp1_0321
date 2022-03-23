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
