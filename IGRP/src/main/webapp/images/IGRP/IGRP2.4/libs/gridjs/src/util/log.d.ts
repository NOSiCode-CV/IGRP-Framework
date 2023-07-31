declare class Logger {
    private format;
    error(message: string, throwException?: boolean): void;
    warn(message: string): void;
    info(message: string): void;
}
declare const _default: Logger;
export default _default;
