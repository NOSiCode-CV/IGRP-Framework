package nosi.core.data.querybuilder.interfaces;

import java.util.List;

/**
 * venceslau.gama
 * 09/10/2020
 */
public interface IIGRPSelectQuery<E> extends IIGRPQuery<E> {

		public String sql();
	
		public List<E> all();
		
		public E one();
		
		//public Long count();
		
		
}
