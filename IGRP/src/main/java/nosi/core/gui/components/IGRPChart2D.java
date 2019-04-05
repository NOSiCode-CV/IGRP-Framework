package nosi.core.gui.components;


/**
 * Emanuel
 * 3 Apr 2019
 */
public class IGRPChart2D{

	private String eixoX;
	private Object eixoY;
	
	public IGRPChart2D( String eixoX, Object eixoY) {
		this.eixoX = eixoX;
		this.eixoY = eixoY;
	}
	
	public IGRPChart2D() {
		
	}

	public String getEixoX() {
		return eixoX;
	}

	public void setEixoX(String eixoX) {
		this.eixoX = eixoX;
	}

	public Object getEixoY() {
		return eixoY;
	}

	public void setEixoY(Object eixoY) {
		this.eixoY = eixoY;
	}

	@Override
	public String toString() {
		return "IGRPChart2D [eixoX=" + eixoX + ", eixoY=" + eixoY + "]";
	}
	
	
}
