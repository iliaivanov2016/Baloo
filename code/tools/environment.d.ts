declare global {
    namespace NodeJS {
        interface ProcessEnv {
            NODE_ENV: 'development' | 'production';
            db_port: string;
            db_name: string;
            db_user: string;
            db_password: string;
            db_host: string;
        }
    }
}

// Convert this file into a module
export {};
