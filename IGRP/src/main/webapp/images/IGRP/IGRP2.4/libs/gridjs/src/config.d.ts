import { CSSDeclaration, OneDArray, ProtoExtends, TColumn, TData } from './types';
import Storage from './storage/storage';
import Pipeline from './pipeline/pipeline';
import Tabular from './tabular';
import { SearchConfig } from './view/plugin/search/search';
import { PaginationConfig } from './view/plugin/pagination';
import Header from './header';
import { ServerStorageOptions } from './storage/server';
import Dispatcher from './util/dispatcher';
import { GenericSortConfig } from './view/plugin/sort/sort';
import { Language, Translator } from './i18n/language';
import { Component, ComponentChild, RefObject } from 'preact';
import { EventEmitter } from './util/eventEmitter';
import { GridEvents } from './events';
import { PluginManager, Plugin } from './plugin';
import Grid from './grid';
export interface Config {
    instance: Grid;
    eventEmitter: EventEmitter<GridEvents>;
    dispatcher: Dispatcher<any>;
    plugin: PluginManager;
    container?: Element;
    tableRef?: RefObject<Component>;
    tempRef?: RefObject<HTMLDivElement>;
    data?: TData | (() => TData) | (() => Promise<TData>);
    server?: ServerStorageOptions;
    header?: Header;
    from: HTMLElement;
    storage: Storage<any>;
    pipeline: Pipeline<Tabular>;
    autoWidth: boolean;
    width: string;
    height: string;
    pagination: PaginationConfig;
    sort: GenericSortConfig;
    translator: Translator;
    style?: Partial<{
        table: CSSDeclaration;
        td: CSSDeclaration;
        th: CSSDeclaration;
        container: CSSDeclaration;
        header: CSSDeclaration;
        footer: CSSDeclaration;
    }>;
    className?: Partial<{
        table: string;
        th: string;
        thead: string;
        tbody: string;
        tr: string;
        td: string;
        container: string;
        footer: string;
        header: string;
        search: string;
        sort: string;
        pagination: string;
        paginationSummary: string;
        paginationButton: string;
        paginationButtonNext: string;
        paginationButtonCurrent: string;
        paginationButtonPrev: string;
        loading: string;
        notfound: string;
        error: string;
    }>;
}
interface UserConfigExtend {
    fixedHeader: boolean;
    resizable: boolean;
    columns: OneDArray<TColumn | string | ComponentChild>;
    search: SearchConfig | boolean;
    pagination: PaginationConfig | boolean;
    sort: GenericSortConfig | boolean;
    language: Language;
    plugins?: Plugin<any>[];
}
export declare type UserConfig = ProtoExtends<Partial<Config>, Partial<UserConfigExtend>>;
export declare class Config {
    private _userConfig;
    constructor(config?: Partial<Config>);
    assign(updatedConfig: Partial<Config>): Config;
    update(userConfig: Partial<UserConfig>): Config;
    static defaultConfig(): Config;
    static fromUserConfig(userConfig: UserConfig): Config;
}
export {};
