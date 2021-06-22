package commentlike;

import java.sql.SQLException;

public class CommentLikeService {
	CommentLikeDAO dao;

	public CommentLikeService() {
		dao=new CommentLikeDAO();
	}
	
	public int insertLike(int comNo, int userNo) throws SQLException {
		return dao.insertLike(comNo, userNo);
	}
	public int deleteLike(int comNo, int userNo) throws SQLException {
		return dao.deleteLike(comNo, userNo);
	}
	public int selectByUserNo(int comNo, int userNo) throws SQLException {
		return dao.selectByUserNo(comNo, userNo);
	}
}
