import { BaseComponent, BaseProps } from './base';
export interface HTMLContentProps extends BaseProps {
    content: string;
    parentElement?: string;
}
export declare class HTMLElement extends BaseComponent<HTMLContentProps> {
    static defaultProps: {
        parentElement: string;
    };
    render(): import("preact").VNode<any>;
}
