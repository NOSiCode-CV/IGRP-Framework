package nosi.core.data.querybuilder.interfaces;

/**
 * venceslau.gama
 * 09/10/2020
 */
public interface IIGRPUpdateQuery<E> extends IIGRPQuery<E> {

   int update();

   String sql();
}
