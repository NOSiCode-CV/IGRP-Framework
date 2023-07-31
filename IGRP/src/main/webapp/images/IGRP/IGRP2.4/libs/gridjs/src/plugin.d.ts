import { BaseComponent, BaseProps } from './view/base';
import { Component, ComponentProps } from 'preact';
export interface PluginBaseProps<T extends PluginBaseComponentCtor> {
    plugin: Plugin<T>;
}
export declare abstract class PluginBaseComponent<P extends PluginBaseProps<any> = any, S = unknown> extends BaseComponent<P, S> {
}
export interface PluginBaseComponentCtor<P extends PluginBaseProps<any> = any, S = unknown> {
    new (props: P, context?: any): Component<P, S>;
}
export declare enum PluginPosition {
    Header = 0,
    Footer = 1,
    Cell = 2
}
export interface Plugin<T extends PluginBaseComponentCtor> {
    id: string;
    position: PluginPosition;
    component: T;
    props?: Partial<ComponentProps<T>>;
    order?: number;
}
export declare class PluginManager {
    private readonly plugins;
    constructor();
    get<T extends PluginBaseComponentCtor>(id: string): Plugin<T> | null;
    add<T extends PluginBaseComponentCtor>(plugin: Plugin<T>): this;
    remove(id: string): this;
    list<T extends PluginBaseComponentCtor>(position?: PluginPosition): Plugin<T>[];
}
export interface PluginRendererProps extends BaseProps {
    props?: any;
    pluginId?: string;
    position?: PluginPosition;
}
export declare class PluginRenderer extends BaseComponent<PluginRendererProps> {
    render(): import("preact").VNode<any>;
}
