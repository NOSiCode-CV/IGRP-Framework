package nosi.core.data.querybuilder.interfaces;

import java.util.List;

/**
 * venceslau.gama
 * 09/10/2020
 */
public interface IIGRPSelectQuery<E> extends IIGRPQuery<E> {

    String sql();

    List<E> all();

    List<E> all(int maxResults);

    List<E> all(int maxResults, int offSet);

    E one();

    long count();

    boolean anyMatch();
}
