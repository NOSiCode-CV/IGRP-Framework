package nosi.core.webapp;
/**
 * Marcel Iekiny
 * Nov 3, 2017
 */
public class ThreadLocalIgrpFactory<T> implements IgrpFactory<T>{
	
	private final ThreadLocal<T> t;

    public ThreadLocalIgrpFactory(final IgrpFactory<T> factory) {
    	this.t = new ThreadLocal<T>() {
            @Override
            protected T initialValue() {
                return factory.create();
            }
        };
    }
    
	@Override
	public T create() {
		return this.t.get();
	}

	public void cleanUp() {
		this.t.remove();
	}
}
