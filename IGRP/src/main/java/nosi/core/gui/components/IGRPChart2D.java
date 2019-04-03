package nosi.core.gui.components;
/**
 * Emanuel
 * 3 Apr 2019
 */
public class IGRPChart2D{

	private String eixoX;
	private double eixoY;
	
	public IGRPChart2D( String eixoX, double eixoY) {
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

	public double getEixoY() {
		return eixoY;
	}

	public void setEixoY(double eixoY) {
		this.eixoY = eixoY;
	}

	@Override
	public String toString() {
		return "IGRPChart2D [eixoX=" + eixoX + ", eixoY=" + eixoY + "]";
	}
	
	
}
