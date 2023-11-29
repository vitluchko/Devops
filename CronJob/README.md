# CronJob

## Realization


![redis](https://github.com/vitluchko/Devops/assets/98816838/565dc14b-b391-4d0f-9557-07aec35f1ea2)


## Overview

This project is a script that utilizes cron to check for changes in a log file and stores information in a Redis database.

## Requirements

Before getting started, make sure you have the following dependencies installed:

- Bash
- Redis

## Installation and Usage

1. Clone the repository:

    ```bash
    git clone https://github.com/your-username/your-repository.git
    cd your-repository
    ```

2. Change the script permissions:

    ```bash
    chmod +x check_log_changes.sh
    ```

3. Add a cron task:

    ```bash
    crontab -e
    ```

    Add a line to execute the script, for example, every hour:

    ```bash
    */2 * * * * /full/path/to/redis.sh
    ```
    
    ![image](https://github.com/vitluchko/Devops/assets/98816838/b6142a2a-5432-45dd-94b8-6edc2d6a4377)


4. Save and close the editor.

## Contribution

If you have ideas or suggestions for improving the project, please open a new issue or submit a pull request.

## License

This project is distributed under the [MIT License](LICENSE).
