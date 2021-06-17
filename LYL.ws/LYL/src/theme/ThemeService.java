package theme;

import java.sql.SQLException;
import java.util.List;


public class ThemeService {
	ThemeDAO dao;
	public static int thnum =0;
	public ThemeService() {
		this.dao = new ThemeDAO();
	}
	
	public List<ThemeVO> selectAllTheme() throws SQLException{
		List<ThemeVO> list = dao.selectAllTheme();
		
		return list;
	}
	public String themeName(int themeNo) throws SQLException {
		String themeName= dao.themeName(themeNo);
		
		return themeName;
	}
}
