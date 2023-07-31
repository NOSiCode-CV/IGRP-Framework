[![ASL 2.0](https://img.shields.io/hexpm/l/plug.svg)](https://github.com/NOSiCode-CV/IGRP-Java-Template-Eclipse/blob/master/README.md)

[<img src="docs/root-images/logo_igrpweb_2.png">](http://www.igrp.cv)

## :loudspeaker: About

IGRP**Web** is a platform developed by the Operational Nucleus for the Information Society (NOSi) to create web applications, based on business steps, processes, automatic code generation and incorporation of the Once-Only-Principle, written in Java.

The IGRP**Web** core is extremely lightweight and based on simple concepts. It's open-source and distributed under the Apache 2.0 license. Allows you to build unlimited number of e-government applications by yourself ensuring sustainability with an affordable and scalable solution on your own data.

## :key: Why use IGRP**Web?**

IGRPWeb allows to:

- Independently create an unlimited number of applications;

- Automatically generate 80% of the code so the customer can focus the other 20% on customizing the application to the organization's needs;

- Control your data and applications;

- Running tests;

- Work with different databases. You can choose the database you prefer: Oracle, Sqlserver, h2, PostgreSQL, MySQL.

- General Sharing between Applications;

- Integrate and interoperate with all native applications as well as third-party applications.

- Use of SQL tools;

- CRUD/DAO Generator;

- Domain Management;

- Document Type Management

- Open-source: released under the Apache 2.0 license, so you can customize every aspect of the system to match your needs.

## :muscle: Studio

IGRP Studio is the environment used to develop applications within igrpweb, it includes the following components:

- **Page Builder** - interface generator;
- **BPMN Designer** - process flow generator;
- **Report Designer** - report generator;
- **Application Builder** - application management.

## :computer: Supported operating systems:

- Windows x64
- MacOS
- Linux
- Docker

(Please note that IGRP Framework may work on other operating systems, but these are not tested nor officially supported at this time.)

## :beginner: Get Start

There’s available a free demo cloud on how to create and run your own IGRP apps on cloud https://cloud.nosi.cv/IGRP:

- User: demo@nosi.cv
- Password: demo

### :computer: Start IGRP Project

**Prerequisites:**
Before running the Maven command to generate the project, ensure that your environment meets the following requirements:

1. Java 17: Make sure you have Java Development Kit (JDK) version 17 or higher installed on your machine.

2. Compatible Database: You need a local database available for the project to run correctly. Ensure that is installed and configured with either the default credentials or the required connection information.

| Database | Minimum | Recommended |
| ---------- | ------- | ----------- |
| MySQL | 5.7.8 | 8.0 |
| MariaDB | 10.3 | 10.6 |
| PostgreSQL | 11.0 | 14.0 |
| H2 | 2.0.204 | 2.1.10 |
| Oracle | 11g | 12c |

**Generating the Project:**

To generate the project using the "igrp-archetype-horizon" archetype, execute the following Maven command:

```bash
mvn archetype:generate -Dfilter=igrp-archetype-horizon
```

Maven will download the necessary dependencies and prompt you for some information to configure the generated project. Follow the instructions that appear in the terminal and provide the required details to customize the project.

Once the generation process is complete, you will have a project based on the "igrp-archetype-horizon" ready to be developed and executed.

Please note that depending on the information provided during project generation, you may need to configure the PostgreSQL database connection details in the project's configuration file to ensure the proper functioning of the application.

Now you are all set to start development with the generated project. Happy coding!

**Running the Project**

To start the application locally, you can use the following Maven command:

```bash
mvn package tomee:run
```

This command will package the application and deploy it to an Apache TomEE server, which will run the web application on your local machine.

Once the server is up and running, you can access the application using the following link in your web browser:

```
http://127.0.0.1:8080/{artifactId}
```

Replace `{artifactId}` with the actual artifact ID of your generated project.

After accessing the link, you should be able to interact with the web application in your browser.

Keep the terminal with the running TomEE server open as long as you want the application to be available locally. If you wish to stop the server, you can use `Ctrl+C` in the terminal to terminate it.

Please note that the specific steps and commands may vary slightly depending on the configuration of the generated project and the environment in which you are running it. Always refer to the project's documentation or README for any project-specific instructions.

### Customizable Properties of the Archetype

When generating the project using the "igrp-archetype-horizon" archetype, you have the option to customize certain properties. Below are the properties that you can modify along with their default values:

| Property      | Description           | Default Value                              |
| --------------|-----------------------|--------------------------------------------|
| dbJdbcUrl     | Database Jdbc Url     | jdbc:postgresql://localhost:5432/db_igrp  |
| dbUser        | Database Username     | postgres                                   |
| dbPassword    | Database Password     | password                                   |
| dbJdbcDriver  | Database Jdbc Driver   | org.postgresql.Driver                      |

To customize these properties during project generation, you will be prompted to provide new values for each of these properties. By default, the values mentioned above will be used unless you specify different values during the project generation process.

These customizable properties allow you to set up the project to connect to your specific PostgreSQL database instance with the appropriate credentials and configuration. Make sure to enter the correct values according to your local database setup to ensure a successful connection.

After generating the project, if you need to modify these properties later on, you can find and update them in the project's configuration file or relevant configuration classes, depending on how the archetype structures the generated project.


## :ballot_box_with_check: Contributing to IGRPWeb

Follow [Contributing guidelines](CONTRIBUTING.md) for more details on how to contribute in the community and how to is the process of submitting pull requests, bugs fixing, patches.

Remember pull requests, bug fixes and new applications development are always encouraged.

## :family: Community Support

For general help using IGRP Framework, please refer to [the official IGRP Framework documentation](https://docs.igrp.cv). For additional help, you can use one of these channels to ask a question:

- [GitHub](https://https://github.com/NOSiCode-CV/IGRP-Framework) (Bug reports, Contributions)
- [Feedback section](https://igrpweb.canny.io) (Roadmap, Feature requests)
- [YouTube Channel](https://www.youtube.com/playlist?list=PL4WRKYdHA5CZRna6eclQvL9q2UI3878vs) (Learn from Video Tutorials)

## :memo: License

The project is licensed under the Apache 2.0 license - see the [LICENSE](LICENSE) file for more details
