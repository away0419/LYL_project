package vidcomment;

import java.sql.SQLException;
import java.util.List;

public class VidCommentService {
	VidCommentDAO dao;

	public VidCommentService() {
		dao=new VidCommentDAO();
	}
	
	public List<VidCommentVO> sellectComment(int vidNo,int vidComCnt) throws SQLException {
		return dao.sellectComment(vidNo, vidComCnt);
	}
}
