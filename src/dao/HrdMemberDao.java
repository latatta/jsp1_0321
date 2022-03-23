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
		return list;
	}
}
