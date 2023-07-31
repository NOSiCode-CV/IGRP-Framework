import BaseStore from '../../base/store';
import { SearchActionsType } from './actions';
export declare type SearchStoreState = {
    keyword: string | null;
};
export declare class SearchStore extends BaseStore<SearchStoreState, SearchActionsType> {
    getInitialState(): SearchStoreState;
    handle(type: any, payload: any): void;
    private search;
}
