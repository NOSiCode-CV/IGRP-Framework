import { BaseActions } from '../../base/actions';
export interface SearchActionsType {
    SEARCH_KEYWORD: {
        keyword: string;
    };
}
export declare class SearchActions extends BaseActions<SearchActionsType> {
    search(keyword: string): void;
}
