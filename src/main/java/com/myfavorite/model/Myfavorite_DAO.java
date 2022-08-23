package com.myfavorite.model;

import java.util.*;
import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class Myfavorite_DAO implements Myfavorite_DAO_interface {

	// 一個應用程式中,針對一個資料庫 ,共用一個DataSource即可
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/MySQL");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = 
		"INSERT INTO my_favorite (item_serial_number,member_serial_number) VALUES (?, ?)";
	private static final String GET_ALL_STMT = 
		"SELECT my_favorite_number,item_serial_number,member_serial_number FROM my_favorite order by my_favorite_number";
	private static final String GET_ONE_STMT = 
		"SELECT my_favorite_number,item_serial_number,member_serial_number FROM my_favorite where my_favorite_number = ?";
	private static final String DELETE = 
		"DELETE FROM my_favorite where my_favorite_number = ?";
//	private static final String UPDATE = 
//		"UPDATE item_category set setItem_category_main_name=?, setItem_category_area_name=?, setItem_category_detail_name=? where item_category_number = ?";

	
	@Override
	public void insert(Myfavorite_VO Myfavorite_VO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, Myfavorite_VO.getItem_serial_number());
			pstmt.setInt(2, Myfavorite_VO.getMember_serial_number());
//			pstmt.setString(3, Myfavorite_VO.getItem_category_detail_name());


			pstmt.executeUpdate();

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

//	@Override
//	public void update(Item_category_VO Item_category_VO) {
//
//		Connection con = null;
//		PreparedStatement pstmt = null;
//
//		try {
//
//			con = ds.getConnection();
//			pstmt = con.prepareStatement(UPDATE);
//
//			pstmt.setString(1, Item_category_VO.getItem_category_main_name());
//			pstmt.setString(2, Item_category_VO.getItem_category_area_name());
//			pstmt.setString(3, Item_category_VO.getItem_category_detail_name());
//
//
//			pstmt.executeUpdate();
//
//			// Handle any driver errors
//		} catch (SQLException se) {
//			throw new RuntimeException("A database error occured. "
//					+ se.getMessage());
//			// Clean up JDBC resources
//		} finally {
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (con != null) {
//				try {
//					con.close();
//				} catch (Exception e) {
//					e.printStackTrace(System.err);
//				}
//			}
//		}
//
//	}

	@Override
	public void delete(Integer my_favorite_number) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, my_favorite_number);

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public Myfavorite_VO findByPrimaryKey(Integer my_favorite_number) {

		Myfavorite_VO Myfavorite_VO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, my_favorite_number);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// Item_category_VO 也稱為 Domain objects
				Myfavorite_VO = new Myfavorite_VO();
				Myfavorite_VO.setMy_favorite_number(rs.getInt("my_favorite_number"));
				Myfavorite_VO.setItem_serial_number(rs.getInt("item_serial_number"));
				Myfavorite_VO.setMember_serial_number(rs.getInt("member_serial_number"));


			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return Myfavorite_VO;
	}

	@Override
	public List<Myfavorite_VO> getAll() {
		List<Myfavorite_VO> list = new ArrayList<Myfavorite_VO>();
		Myfavorite_VO Myfavorite_VO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// Item_category_VO 也稱為 Domain objects
				Myfavorite_VO = new Myfavorite_VO();
				Myfavorite_VO.setMy_favorite_number(rs.getInt("my_favorite_number"));
				Myfavorite_VO.setItem_serial_number(rs.getInt("item_serial_number"));
				Myfavorite_VO.setMember_serial_number(rs.getInt("member_serial_number"));

				list.add(Myfavorite_VO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	@Override
	public List<Myfavorite_VO> getAll(Map<String, String[]> map) {
		List<Myfavorite_VO> list = new ArrayList<Myfavorite_VO>();
		Myfavorite_VO Myfavorite_VO = null;
	
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		try {
			
			con = ds.getConnection();
			String finalSQL = "select * from emp2 "
		          + "order by empno";
			pstmt = con.prepareStatement(finalSQL);
			System.out.println("●●finalSQL(by DAO) = "+finalSQL);
			rs = pstmt.executeQuery();
	
			while (rs.next()) {
				Myfavorite_VO = new Myfavorite_VO();
				Myfavorite_VO.setMy_favorite_number(rs.getInt("my_favorite_number"));
				Myfavorite_VO.setItem_serial_number(rs.getInt("item_serial_number"));
				Myfavorite_VO.setMember_serial_number(rs.getInt("member_serial_number"));

				list.add(Myfavorite_VO); // Store the row in the List
			}
	
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
}