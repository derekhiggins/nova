BEGIN TRANSACTION;

    CREATE TEMPORARY TABLE instances_backup (
                created_at DATETIME,
                updated_at DATETIME,
                deleted_at DATETIME,
                deleted BOOLEAN,
                id INTEGER NOT NULL,
                internal_id INTEGER,
                user_id VARCHAR(255),
                project_id VARCHAR(255),
                image_ref VARCHAR(255),
                kernel_id VARCHAR(255),
                ramdisk_id VARCHAR(255),
                server_name VARCHAR(255),
                launch_index INTEGER,
                key_name VARCHAR(255),
                key_data TEXT,
                power_state INTEGER,
                vm_state VARCHAR(255),
                memory_mb INTEGER,
                vcpus INTEGER,
                local_gb INTEGER,
                hostname VARCHAR(255),
                host VARCHAR(255),
                user_data TEXT,
                reservation_id VARCHAR(255),
                scheduled_at DATETIME,
                launched_at DATETIME,
                terminated_at DATETIME,
                display_name VARCHAR(255),
                display_description VARCHAR(255),
                availability_zone VARCHAR(255),
                locked BOOLEAN,
                os_type VARCHAR(255),
                launched_on TEXT,
                instance_type_id INTEGER,
                vm_mode VARCHAR(255),
                uuid VARCHAR(36),
                architecture VARCHAR(255),
                root_device_name VARCHAR(255),
                access_ip_v4 VARCHAR(255),
                access_ip_v6 VARCHAR(255),
                config_drive VARCHAR(255),
                task_state VARCHAR(255),
                default_local_device VARCHAR(255),
                default_swap_device VARCHAR(255),
                progress INTEGER,
                auto_disk_config BOOLEAN,
                shutdown_terminate BOOLEAN,
                disable_terminate BOOLEAN,
                PRIMARY KEY (id),
                CHECK (deleted IN (0, 1)),
                CHECK (locked IN (0, 1)),
                CHECK (auto_disk_config IN (0, 1)),
                CHECK (shutdown_terminate IN (0, 1)),
                CHECK (disable_terminate IN (0, 1))
    );

    INSERT INTO instances_backup
        SELECT created_at,
               updated_at,
               deleted_at,
               deleted,
               id,
               internal_id,
               user_id,
               project_id,
               image_ref,
               kernel_id,
               ramdisk_id,
               server_name,
               launch_index,
               key_name,
               key_data,
               power_state,
               vm_state,
               memory_mb,
               vcpus,
               local_gb,
               hostname,
               host,
               user_data,
               reservation_id,
               scheduled_at,
               launched_at,
               terminated_at,
               display_name,
               display_description,
               availability_zone,
               locked,
               os_type,
               launched_on,
               instance_type_id,
               vm_mode,
               uuid,
               architecture,
               root_device_name,
               access_ip_v4,
               access_ip_v6,
               config_drive,
               task_state,
               default_local_device,
               default_swap_device,
               progress,
               auto_disk_config,
               shutdown_terminate,
               disable_terminate
       FROM instances;

    DROP TABLE instances;

    CREATE TABLE instances(
                created_at DATETIME,
                updated_at DATETIME,
                deleted_at DATETIME,
                deleted BOOLEAN,
                id INTEGER NOT NULL,
                internal_id INTEGER,
                user_id VARCHAR(255),
                project_id VARCHAR(255),
                image_ref VARCHAR(255),
                kernel_id VARCHAR(255),
                ramdisk_id VARCHAR(255),
                server_name VARCHAR(255),
                launch_index INTEGER,
                key_name VARCHAR(255),
                key_data TEXT,
                power_state INTEGER,
                vm_state VARCHAR(255),
                memory_mb INTEGER,
                vcpus INTEGER,
                local_gb INTEGER,
                hostname VARCHAR(255),
                host VARCHAR(255),
                user_data TEXT,
                reservation_id VARCHAR(255),
                scheduled_at DATETIME,
                launched_at DATETIME,
                terminated_at DATETIME,
                display_name VARCHAR(255),
                display_description VARCHAR(255),
                availability_zone VARCHAR(255),
                locked BOOLEAN,
                os_type VARCHAR(255),
                launched_on TEXT,
                instance_type_id INTEGER,
                vm_mode VARCHAR(255),
                uuid VARCHAR(36),
                architecture VARCHAR(255),
                root_device_name VARCHAR(255),
                access_ip_v4 VARCHAR(255),
                access_ip_v6 VARCHAR(255),
                config_drive VARCHAR(255),
                task_state VARCHAR(255),
                default_local_device VARCHAR(255),
                default_swap_device VARCHAR(255),
                progress INTEGER,
                auto_disk_config BOOLEAN,
                PRIMARY KEY (id),
                CHECK (deleted IN (0, 1)),
                CHECK (locked IN (0, 1)),
                CHECK (auto_disk_config IN (0, 1))
    );

    CREATE INDEX project_id ON instances (project_id);
    CREATE UNIQUE INDEX uuid ON instances (uuid);

    INSERT INTO instances
        SELECT created_at,
               updated_at,
               deleted_at,
               deleted,
               id,
               internal_id,
               user_id,
               project_id,
               image_ref,
               kernel_id,
               ramdisk_id,
               server_name,
               launch_index,
               key_name,
               key_data,
               power_state,
               vm_state,
               memory_mb,
               vcpus,
               local_gb,
               hostname,
               host,
               user_data,
               reservation_id,
               scheduled_at,
               launched_at,
               terminated_at,
               display_name,
               display_description,
               availability_zone,
               locked,
               os_type,
               launched_on,
               instance_type_id,
               vm_mode,
               uuid,
               architecture,
               root_device_name,
               access_ip_v4,
               access_ip_v6,
               config_drive,
               task_state,
               default_local_device,
               default_swap_device,
               progress,
               auto_disk_config
       FROM instances_backup;

    DROP TABLE instances_backup;
COMMIT;
