package vidcomment;

import java.sql.SQLException;
import java.util.List;

public class VidCommentService {
	VidCommentDAO dao;

	public VidCommentService() {
		dao=new VidCommentDAO();
	}
	
	public List<VidCommentVO> sellectComment(int vidNo,int vidComCnt,int vidComGroup) throws SQLException {
		return dao.sellectComment(vidNo, vidComCnt, vidComGroup);
	}
	
	public int insertComment(VidCommentVO vo) throws SQLException{
		return dao.insertComment(vo);
	}
	public int deleteComment(int comNo) throws SQLException{
		return dao.deleteComment(comNo);
	}
}
