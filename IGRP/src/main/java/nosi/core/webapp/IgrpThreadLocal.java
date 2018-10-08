package nosi.core.webapp;
/**
 * Iekiny Marcel
 * Oct 8, 2018
 */
public class IgrpThreadLocal {
	
	private ThreadLocal<Igrp> t;
	
	public IgrpThreadLocal() {
		t = new ThreadLocal<>();
	}
	
	public Igrp getCurrentInstance() {
		return this.t.get();
	}
	
	public void set(Igrp t) {
		this.t.set(t);
	}
	
	public void cleanUp() {
		this.t.remove();
	}
	
}
