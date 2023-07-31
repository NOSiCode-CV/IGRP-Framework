import { h } from 'preact';
import { BaseComponent, BaseProps } from '../base';
export interface MessageRowProps extends BaseProps {
    message: string;
    colSpan?: number;
    className?: string;
}
export declare class MessageRow extends BaseComponent<MessageRowProps> {
    render(): h.JSX.Element;
}
