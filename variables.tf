variable "lambda_map" {
  type = map(object({
    function = optional(object({
      function_name    = string
      role             = optional(string)
      role_custom_name = optional(string)
      architectures    = optional(list(string))
      capacity_provider_config = optional(object({
        lambda_managed_instances_capacity_provider_config = object({
          capacity_provider_arn                     = string
          execution_environment_memory_gib_per_vcpu = optional(number)
          per_execution_environment_max_concurrency = optional(number)
        })
      }))
      code_sha256             = optional(string)
      code_signing_config_arn = optional(string)

      dead_letter_config = optional(object({
        target_arn = string
      }))
      description = optional(string)

      durable_config = optional(object({
        execution_timeout = number
        retention_period  = optional(number)
      }))

      environment = optional(object({
        variables = optional(map(string))
      }))

      ephemeral_storage = optional(object({
        size = number
      }))

      file_system_config = optional(object({
        arn              = string
        local_mount_path = string
      }))

      filename = optional(string)
      handler  = optional(string)

      image_config = optional(object({
        command           = optional(list(string))
        entry_point       = optional(list(string))
        working_directory = optional(string)
      }))

      image_uri               = optional(string)
      kms_key_arn             = optional(string)
      kms_key_custom_name     = optional(string)
      replica_key_custom_name = optional(string)
      layers                  = optional(list(string))
      layer_custom_names      = optional(list(string))

      logging_config = optional(object({
        log_format            = string
        application_log_level = optional(string)
        log_group             = optional(string)
        log_group_custom_name = optional(string)
        system_log_level      = optional(string)
      }))

      memory_size                        = optional(number)
      package_type                       = optional(string)
      publish                            = optional(bool)
      publish_to                         = optional(string)
      region                             = optional(string)
      replace_security_groups_on_destroy = optional(bool)
      replacement_security_group_ids     = optional(set(string))
      reserved_concurrent_executions     = optional(number)
      runtime                            = optional(string)
      s3_bucket                          = optional(string)
      s3_bucket_custom_name              = optional(string)
      s3_key                             = optional(string)
      s3_key_custom_name                 = optional(string)
      s3_object_version                  = optional(string)
      skip_destroy                       = optional(bool)
      source_code_hash                   = optional(string)
      source_kms_key_arn                 = optional(string)
      source_kms_key_custom_name         = optional(string)
      source_replica_key_custom_name     = optional(string)

      snap_start = optional(object({
        apply_on = string
      }))

      timeout = optional(number)

      tenancy_config = optional(object({
        tenant_isolation_mode = string
      }))

      tracing_config = optional(object({
        mode = string
      }))

      vpc_config = optional(object({
        ipv6_allowed_for_dual_stack = optional(bool)
        subnet_ids                  = list(string)
        security_group_ids          = optional(list(string), [])
        security_group_custom_names = optional(list(string), [])
      }))

      use_resource_timeout_for_propagation = optional(bool)

      tags = optional(map(string))

      timeouts = optional(object({
        create = optional(string)
        update = optional(string)
        delete = optional(string)
      }))

    }))

    layer_versions = optional(map(object({
      layer_name               = string
      compatible_architectures = optional(list(string))
      compatible_runtimes      = optional(list(string))
      description              = optional(string)
      filename                 = optional(string)
      license_info             = optional(string)
      region                   = optional(string)
      s3_bucket                = optional(string)
      s3_bucket_custom_name    = optional(string)
      s3_key                   = optional(string)
      s3_key_custom_name       = optional(string)
      s3_object_version        = optional(string)
      skip_destroy             = optional(bool)
      source_code_hash         = optional(string)
    })), {})

    permissions = optional(map(object({
      action                   = string
      principal                = string
      function_name            = optional(string)
      alias_custom_name        = optional(string)
      event_source_token       = optional(string)
      function_url_auth_type   = optional(string)
      invoked_via_function_url = optional(bool)
      principal_org_id         = optional(string)
      qualifier                = optional(string)
      region                   = optional(string)
      source_account           = optional(string)
      source_arn               = optional(string)
      statement_id             = optional(string)
      statement_id_prefix      = optional(string)

      timeouts = optional(object({
        create = optional(string)
        read   = optional(string)
        delete = optional(string)
      }))
    })), {})

    aliases = optional(map(object({
      name             = string
      function_name    = optional(string)
      function_version = optional(string)
      description      = optional(string)
      region           = optional(string)
      routing_config = optional(object({
        additional_version_weights = optional(map(number))
      }))
      timeouts = optional(object({
        update = optional(string)
      }))
    })), {})

    code_signing_config = optional(object({
      allowed_publishers = object({
        signing_profile_version_arns = set(string)
      })
      description = optional(string)
      policies = optional(object({
        untrusted_artifact_on_deployment = string
      }))
      region = optional(string)
      tags   = optional(map(string))
    }))

    event_source_mappings = optional(map(object({
      function_name     = optional(string)
      alias_custom_name = optional(string)
      amazon_managed_kafka_event_source_config = optional(object({
        consumer_group_id = optional(string)
        schema_registry_config = optional(object({
          access_config = optional(object({
            type = optional(string)
            uri  = optional(string)
          }))
          event_record_format = optional(string)
          schema_registry_uri = optional(string)
          schema_validation_config = optional(set(object({
            attribute = optional(string)
          })), [])
        }))
      }))
      batch_size                     = optional(number)
      bisect_batch_on_function_error = optional(bool)
      destination_config = optional(object({
        on_failure = optional(object({
          destination_arn = string
        }))
      }))
      document_db_event_source_config = optional(object({
        database_name   = string
        collection_name = optional(string)
        full_document   = optional(string)
      }))
      enabled          = optional(bool)
      event_source_arn = optional(string)
      filter_criteria = optional(object({
        filter = optional(set(object({
          pattern = optional(string)
        })), [])
      }))
      function_response_types            = optional(set(string), [])
      kms_key_arn                        = optional(string)
      kms_key_custom_name                = optional(string)
      replica_key_custom_name            = optional(string)
      maximum_batching_window_in_seconds = optional(number)
      maximum_record_age_in_seconds      = optional(number)
      maximum_retry_attempts             = optional(number)
      metrics_config = optional(object({
        metrics = set(string)
      }))
      parallelization_factor = optional(number)
      provisioned_poller_config = optional(object({
        maximum_pollers   = optional(number)
        minimum_pollers   = optional(number)
        poller_group_name = optional(string)
      }))
      queues = optional(list(string), [])
      region = optional(string)
      scaling_config = optional(object({
        maximum_concurrency = optional(number)
      }))
      self_managed_event_source = optional(object({
        endpoints = map(string)
      }))
      self_managed_kafka_event_source_config = optional(object({
        consumer_group_id = optional(string)
        schema_registry_config = optional(object({
          access_config = optional(object({
            type = optional(string)
            uri  = optional(string)
          }))
          event_record_format = optional(string)
          schema_registry_uri = optional(string)
          schema_validation_config = optional(set(object({
            attribute = optional(string)
          })), [])
        }))
      }))
      source_access_configuration = optional(set(object({
        type = string
        uri  = string
      })), [])
      starting_position                    = optional(string)
      starting_position_timestamp          = optional(string)
      topics                               = optional(set(string), [])
      tumbling_window_in_seconds           = optional(number)
      use_resource_timeout_for_propagation = optional(bool)
      tags                                 = optional(map(string))
      timeouts = optional(object({
        create = optional(string)
        update = optional(string)
        delete = optional(string)
      }))
    })), {})

    function_event_invoke_configs = optional(map(object({
      function_name                = optional(string)
      alias_custom_name            = optional(string)
      maximum_event_age_in_seconds = optional(number)
      maximum_retry_attempts       = optional(number)
      qualifier                    = optional(string)
      region                       = optional(string)
      destination_config = optional(object({
        on_failure = optional(object({
          destination = string
        }))
        on_success = optional(object({
          destination = string
        }))
      }))
    })), {})

    function_urls = optional(map(object({
      authorization_type = string
      function_name      = optional(string)
      alias_custom_name  = optional(string)
      invoke_mode        = optional(string)
      qualifier          = optional(string)
      region             = optional(string)
      cors = optional(object({
        allow_credentials = optional(bool)
        allow_headers     = optional(list(string))
        allow_methods     = optional(list(string))
        allow_origins     = optional(list(string))
        expose_headers    = optional(list(string))
        max_age           = optional(number)
      }))
      timeouts = optional(object({
        create = optional(string)
      }))
    })), {})

    provisioned_concurrency_configs = optional(map(object({
      provisioned_concurrent_executions = number
      function_name                     = optional(string)
      alias_custom_name                 = optional(string)
      qualifier                         = optional(string)
      region                            = optional(string)
      skip_destroy                      = optional(bool)
      timeouts = optional(object({
        create = optional(string)
        update = optional(string)
      }))
    })), {})

    runtime_management_configs = optional(map(object({
      function_name       = optional(string)
      qualifier           = optional(string)
      region              = optional(string)
      runtime_version_arn = optional(string)
      update_runtime_on   = optional(string)
    })), {})

    layer_version_permissions = optional(map(object({
      action            = string
      principal         = string
      statement_id      = string
      layer_name        = optional(string)
      layer_custom_name = optional(string)
      version_number    = optional(number)
      organization_id   = optional(string)
      region            = optional(string)
      skip_destroy      = optional(bool)
    })), {})

    function_recursion_config = optional(object({
      recursive_loop = string
      function_name  = optional(string)
      region         = optional(string)
    }))
  }))

  description = "Keyed collection of lambda definitions"
}

variable "kms_map" {
  type = map(object({
    key = optional(object({
      region                             = optional(string)
      description                        = optional(string)
      key_usage                          = optional(string)
      custom_key_store_id                = optional(string)
      custom_key_store_custom_name       = optional(string)
      customer_master_key_spec           = optional(string)
      policy                             = optional(string)
      iam_custom_name                    = optional(string)
      policy_custom_name                 = optional(string)
      bypass_policy_lockout_safety_check = optional(bool)
      deletion_window_in_days            = optional(number)
      is_enabled                         = optional(bool)
      enable_key_rotation                = optional(bool)
      rotation_period_in_days            = optional(number)
      multi_region                       = optional(bool)
      xks_key_id                         = optional(string)
      tags                               = optional(map(string))
      timeouts = optional(object({
        create = optional(string)
      }))
    }))

    external_key = optional(object({
      region                             = optional(string)
      description                        = optional(string)
      key_spec                           = optional(string)
      key_usage                          = optional(string)
      policy                             = optional(string)
      iam_custom_name                    = optional(string)
      policy_custom_name                 = optional(string)
      bypass_policy_lockout_safety_check = optional(bool)
      deletion_window_in_days            = optional(number)
      enabled                            = optional(bool)
      key_material_base64                = optional(string)
      multi_region                       = optional(bool)
      valid_to                           = optional(string)
      tags                               = optional(map(string))
    }))

    existing_key = optional(object({
      region       = optional(string)
      key_id       = string
      grant_tokens = optional(list(string))
    }))

    aliases = optional(map(object({
      region                  = optional(string)
      name                    = optional(string)
      name_prefix             = optional(string)
      target_key_id           = optional(string)
      replica_key_custom_name = optional(string)
    })), {})

    grants = optional(map(object({
      region                                   = optional(string)
      key_id                                   = optional(string)
      replica_key_custom_name                  = optional(string)
      name                                     = optional(string)
      grantee_principal                        = optional(string)
      grantee_iam_custom_name                  = optional(string)
      grantee_role_custom_name                 = optional(string)
      grantee_user_custom_name                 = optional(string)
      grantee_service_linked_role_custom_name  = optional(string)
      operations                               = set(string)
      retiring_principal                       = optional(string)
      retiring_iam_custom_name                 = optional(string)
      retiring_role_custom_name                = optional(string)
      retiring_user_custom_name                = optional(string)
      retiring_service_linked_role_custom_name = optional(string)
      retire_on_delete                         = optional(bool)
      grant_creation_tokens                    = optional(set(string))
      constraints = optional(set(object({
        encryption_context_equals = optional(map(string))
        encryption_context_subset = optional(map(string))
      })))
    })), {})

    replica_keys = optional(map(object({
      region                             = optional(string)
      primary_key_arn                    = optional(string)
      description                        = optional(string)
      policy                             = optional(string)
      iam_custom_name                    = optional(string)
      policy_custom_name                 = optional(string)
      bypass_policy_lockout_safety_check = optional(bool)
      deletion_window_in_days            = optional(number)
      enabled                            = optional(bool)
      tags                               = optional(map(string))
    })), {})

    replica_external_keys = optional(map(object({
      region                             = optional(string)
      primary_key_arn                    = optional(string)
      description                        = optional(string)
      policy                             = optional(string)
      iam_custom_name                    = optional(string)
      policy_custom_name                 = optional(string)
      bypass_policy_lockout_safety_check = optional(bool)
      deletion_window_in_days            = optional(number)
      enabled                            = optional(bool)
      key_material_base64                = optional(string)
      valid_to                           = optional(string)
      tags                               = optional(map(string))
    })), {})

    key_policy = optional(object({
      region                             = optional(string)
      key_id                             = optional(string)
      policy                             = optional(string)
      iam_custom_name                    = optional(string)
      policy_custom_name                 = optional(string)
      bypass_policy_lockout_safety_check = optional(bool)
    }))

    custom_key_stores = optional(map(object({
      region                   = optional(string)
      custom_key_store_name    = string
      custom_key_store_type    = optional(string)
      cloud_hsm_cluster_id     = optional(string)
      key_store_password       = optional(string)
      trust_anchor_certificate = optional(string)
      xks_proxy_authentication_credential = optional(object({
        access_key_id         = string
        raw_secret_access_key = string
      }))
      xks_proxy_connectivity              = optional(string)
      xks_proxy_uri_endpoint              = optional(string)
      xks_proxy_uri_path                  = optional(string)
      xks_proxy_vpc_endpoint_service_name = optional(string)
      timeouts = optional(object({
        create = optional(string)
        update = optional(string)
        delete = optional(string)
      }))
    })), {})

    public_key = optional(object({
      region                  = optional(string)
      key_id                  = optional(string)
      replica_key_custom_name = optional(string)
      grant_tokens            = optional(list(string))
    }))
  }))

  description = "Keyed collection of kms definitions"
  default     = {}
}

variable "cloudwatch_map" {
  type = map(object({
    dashboard = optional(object({
      dashboard_name = string
      dashboard_body = string
      region         = optional(string)
    }))

    metric_alarms = optional(map(object({
      alarm_name                            = string
      comparison_operator                   = optional(string)
      evaluation_periods                    = optional(number)
      evaluation_interval                   = optional(number)
      metric_name                           = optional(string)
      namespace                             = optional(string)
      period                                = optional(number)
      statistic                             = optional(string)
      threshold                             = optional(number)
      threshold_metric_id                   = optional(string)
      actions_enabled                       = optional(bool)
      alarm_actions                         = optional(list(string))
      alarm_description                     = optional(string)
      datapoints_to_alarm                   = optional(number)
      dimensions                            = optional(map(string))
      insufficient_data_actions             = optional(list(string))
      ok_actions                            = optional(list(string))
      unit                                  = optional(string)
      extended_statistic                    = optional(string)
      treat_missing_data                    = optional(string)
      evaluate_low_sample_count_percentiles = optional(string)

      evaluation_criteria = optional(object({
        promql_criteria = object({
          query           = string
          pending_period  = optional(number)
          recovery_period = optional(number)
        })
      }))

      metric_query = optional(list(object({
        id          = string
        account_id  = optional(string)
        expression  = optional(string)
        label       = optional(string)
        period      = optional(number)
        return_data = optional(bool)

        metric = optional(object({
          dimensions  = optional(map(string))
          metric_name = string
          namespace   = optional(string)
          period      = number
          stat        = string
          unit        = optional(string)
        }))
      })), [])

      tags   = optional(map(string))
      region = optional(string)
    })), {})

    composite_alarms = optional(map(object({
      actions_enabled = optional(bool)

      actions_suppressor = optional(object({
        alarm            = string
        extension_period = number
        wait_period      = number
      }))

      alarm_name                = string
      alarm_rule                = string
      alarm_actions             = optional(list(string))
      alarm_description         = optional(string)
      insufficient_data_actions = optional(list(string))
      ok_actions                = optional(list(string))
      tags                      = optional(map(string))
      region                    = optional(string)
    })), {})

    metric_streams = optional(map(object({
      firehose_arn                    = string
      role_arn                        = optional(string)
      role_custom_name                = optional(string)
      output_format                   = string
      name                            = optional(string)
      name_prefix                     = optional(string)
      include_linked_accounts_metrics = optional(bool)
      region                          = optional(string)
      tags                            = optional(map(string))

      exclude_filter = optional(set(object({
        namespace    = string
        metric_names = optional(set(string))
      })), [])

      include_filter = optional(set(object({
        namespace    = string
        metric_names = optional(set(string))
      })), [])

      statistics_configuration = optional(set(object({
        additional_statistics = set(string)
        include_metric = set(object({
          metric_name = string
          namespace   = string
        }))
      })), [])

      timeouts = optional(object({
        create = optional(string)
        update = optional(string)
        delete = optional(string)
      }))
    })), {})
  }))

  description = "Keyed collection of cloudwatch definitions"
  default     = {}
}

variable "cloudwatch_logs_map" {
  type = map(object({
    log_group = optional(object({
      name                        = optional(string)
      name_prefix                 = optional(string)
      skip_destroy                = optional(bool)
      log_group_class             = optional(string)
      retention_in_days           = optional(number)
      kms_key_id                  = optional(string)
      kms_key_custom_name         = optional(string)
      replica_key_custom_name     = optional(string)
      deletion_protection_enabled = optional(bool)
      region                      = optional(string)
      tags                        = optional(map(string))
    }))

    log_stream = optional(object({
      name           = string
      log_group_name = optional(string)
      region         = optional(string)
    }))

    account_policy = optional(object({
      policy_document             = optional(string)
      policy_document_custom_name = optional(string)
      policy_type                 = string
      policy_name                 = string
      scope                       = optional(string)
      selection_criteria          = optional(string)
      region                      = optional(string)
    }))

    destination_policies = optional(list(object({
      access_policy           = string
      destination_name        = optional(string)
      force_update            = optional(bool)
      destination_custom_name = optional(string)
      region                  = optional(string)
    })), [])

    data_protection_policy = optional(object({
      policy_document             = optional(string)
      policy_document_custom_name = optional(string)
      log_group_name              = optional(string)
      region                      = optional(string)
    }))

    destinations = optional(map(object({
      name             = string
      role_arn         = optional(string)
      role_custom_name = optional(string)
      target_arn       = string
      tags             = optional(map(string))
      region           = optional(string)
    })), {})

    metric_filters = optional(list(object({
      name                      = string
      pattern                   = string
      log_group_name            = optional(string)
      apply_on_transformed_logs = optional(bool)
      region                    = optional(string)

      metric_transformation = object({
        name          = string
        namespace     = string
        value         = string
        default_value = optional(number)
        dimensions    = optional(map(string))
        unit          = optional(string)
      })
    })), [])

    resource_policy = optional(object({
      policy_document = string
      policy_name     = optional(string)
      resource_arn    = optional(string)
      region          = optional(string)
    }))

    subscription_filters = optional(list(object({
      name                      = string
      destination_arn           = optional(string)
      destination_custom_name   = optional(string)
      filter_pattern            = string
      log_group_name            = optional(string)
      role_arn                  = optional(string)
      role_custom_name          = optional(string)
      distribution              = optional(string)
      apply_on_transformed_logs = optional(bool)
      emit_system_fields        = optional(set(string))
      region                    = optional(string)
    })), [])

    query_definitions = optional(list(object({
      name            = string
      query_string    = string
      log_group_names = optional(list(string))
      region          = optional(string)
    })), [])

    anomaly_detectors = optional(map(object({
      enabled                 = bool
      log_group_arn_list      = optional(list(string))
      anomaly_visibility_time = optional(number)
      detector_name           = optional(string)
      evaluation_frequency    = optional(string)
      filter_pattern          = optional(string)
      kms_key_id              = optional(string)
      kms_key_custom_name     = optional(string)
      replica_key_custom_name = optional(string)
      region                  = optional(string)
      tags                    = optional(map(string))
    })), {})

    data_protection_policy_documents = optional(map(object({
      name           = string
      description    = optional(string)
      policy_version = optional(string)

      configuration = optional(object({
        custom_data_identifier = optional(list(object({
          name  = string
          regex = string
        })), [])
      }))

      statement = list(object({
        data_identifiers = set(string)
        sid              = optional(string)
        operation = object({
          audit = optional(object({
            findings_destination = object({
              cloudwatch_logs = optional(object({
                log_group = string
              }))
              firehose = optional(object({
                delivery_stream = string
              }))
              s3 = optional(object({
                bucket = string
              }))
            })
          }))
          deidentify = optional(object({
            mask_config = object({})
          }))
        })
      }))
    })), {})

    index_policy = optional(object({
      log_group_name  = optional(string)
      policy_document = string
      region          = optional(string)
    }))

    transformer = optional(object({
      log_group_arn = optional(string)
      region        = optional(string)

      transformer_config = list(object({
        add_keys = optional(object({
          entry = list(object({
            key                 = string
            value               = string
            overwrite_if_exists = optional(bool)
          }))
        }))
        copy_value = optional(object({
          entry = list(object({
            source              = string
            target              = string
            overwrite_if_exists = optional(bool)
          }))
        }))
        csv = optional(list(object({
          columns         = optional(list(string))
          delimiter       = optional(string)
          quote_character = optional(string)
          source          = optional(string)
        })), [])
        date_time_converter = optional(list(object({
          locale          = optional(string)
          match_patterns  = list(string)
          source          = string
          source_timezone = optional(string)
          target          = string
          target_format   = optional(string)
          target_timezone = optional(string)
        })), [])
        delete_keys = optional(list(object({
          with_keys = list(string)
        })), [])
        grok = optional(object({
          match  = string
          source = optional(string)
        }))
        list_to_map = optional(list(object({
          flatten           = optional(bool)
          flattened_element = optional(string)
          key               = string
          source            = string
          target            = optional(string)
          value_key         = optional(string)
        })), [])
        lower_case_string = optional(list(object({
          with_keys = list(string)
        })), [])
        move_keys = optional(list(object({
          entry = list(object({
            source              = string
            target              = string
            overwrite_if_exists = optional(bool)
          }))
        })), [])
        parse_cloudfront = optional(object({
          source = optional(string)
        }))
        parse_json = optional(list(object({
          destination = optional(string)
          source      = optional(string)
        })), [])
        parse_key_value = optional(list(object({
          destination         = optional(string)
          field_delimiter     = optional(string)
          key_prefix          = optional(string)
          key_value_delimiter = optional(string)
          non_match_value     = optional(string)
          overwrite_if_exists = optional(bool)
          source              = optional(string)
        })), [])
        parse_postgres = optional(object({
          source = optional(string)
        }))
        parse_route53 = optional(object({
          source = optional(string)
        }))
        parse_to_ocsf = optional(object({
          event_source = string
          ocsf_version = string
          source       = optional(string)
        }))
        parse_vpc = optional(object({
          source = optional(string)
        }))
        parse_waf = optional(object({
          source = optional(string)
        }))
        rename_keys = optional(list(object({
          entry = list(object({
            key                 = string
            rename_to           = string
            overwrite_if_exists = optional(bool)
          }))
        })), [])
        split_string = optional(list(object({
          entry = list(object({
            delimiter = string
            source    = string
          }))
        })), [])
        substitute_string = optional(list(object({
          entry = list(object({
            from   = string
            source = string
            to     = string
          }))
        })), [])
        trim_string = optional(list(object({
          with_keys = list(string)
        })), [])
        type_converter = optional(list(object({
          entry = list(object({
            key  = string
            type = string
          }))
        })), [])
        upper_case_string = optional(list(object({
          with_keys = list(string)
        })), [])
      }))
    }))

    delivery_sources = optional(map(object({
      region       = optional(string)
      name         = string
      log_type     = string
      resource_arn = string
      tags         = optional(map(string))
    })), {})

    delivery_destinations = optional(map(object({
      region                    = optional(string)
      name                      = string
      delivery_destination_type = optional(string)
      output_format             = optional(string)
      delivery_destination_configuration = optional(object({
        destination_resource_arn = optional(string)
        # (Optional) Defaults to the log group in this entry when this configuration is provided.
      }))
      tags = optional(map(string))
    })), {})

    deliveries = optional(map(object({
      region                      = optional(string)
      delivery_source_name        = optional(string)
      delivery_source_custom_name = optional(string)
      # (Optional) Key in delivery_sources. Used when delivery_source_name is omitted.
      delivery_destination_arn         = optional(string)
      delivery_destination_custom_name = optional(string)
      # (Optional) Key in delivery_destinations. Used when delivery_destination_arn is omitted.
      field_delimiter = optional(string)
      record_fields   = optional(list(string))
      s3_delivery_configuration = optional(list(object({
        enable_hive_compatible_path = optional(bool)
        suffix_path                 = optional(string)
      })))
      tags = optional(map(string))
    })), {})
  }))

  description = "Keyed collection of cloudwatch logs definitions"
  default     = {}
}

variable "s3_map" {
  type = map(object({
    access_grants = optional(map(object({
      region                             = optional(string)
      account_id                         = optional(string)
      access_grants_location_id          = optional(string)
      access_grants_location_custom_name = optional(string)
      permission                         = string
      s3_prefix_type                     = optional(string)

      access_grants_location_configuration = optional(object({
        s3_sub_prefix = optional(string)
      }))

      grantee = object({
        grantee_identifier = optional(string)
        grantee_type       = string
        role_custom_name   = optional(string)
        iam_custom_name    = optional(string)
        user_custom_name   = optional(string)
      })

      tags = optional(map(string))
    })), {})

    access_grants_instances = optional(map(object({
      region              = optional(string)
      account_id          = optional(string)
      identity_center_arn = optional(string)

      tags = optional(map(string))
    })), {})

    access_grants_instance_resource_policies = optional(map(object({
      region                             = optional(string)
      account_id                         = optional(string)
      access_grants_instance_custom_name = optional(string)
      policy                             = optional(string)
      iam_custom_name                    = optional(string)
      policy_custom_name                 = optional(string)
    })), {})

    access_grants_locations = optional(map(object({
      region                             = optional(string)
      account_id                         = optional(string)
      access_grants_instance_custom_name = optional(string)
      iam_role_arn                       = optional(string)
      iam_role_custom_name               = optional(string)
      location_scope                     = optional(string)

      tags = optional(map(string))
    })), {})

    access_points = optional(map(object({
      region             = optional(string)
      bucket             = optional(string)
      name               = string
      account_id         = optional(string)
      bucket_account_id  = optional(string)
      policy             = optional(string)
      iam_custom_name    = optional(string)
      policy_custom_name = optional(string)

      public_access_block_configuration = optional(object({
        block_public_acls       = optional(bool)
        block_public_policy     = optional(bool)
        ignore_public_acls      = optional(bool)
        restrict_public_buckets = optional(bool)
      }))

      vpc_configuration = optional(object({
        vpc_id = string
      }))

      tags = optional(map(string))
    })), {})

    access_point_policies = optional(map(object({
      region                   = optional(string)
      access_point_arn         = optional(string)
      access_point_custom_name = optional(string)
      policy                   = optional(string)
      iam_custom_name          = optional(string)
      policy_custom_name       = optional(string)
    })), {})

    bucket = optional(object({
      region              = optional(string)
      bucket              = optional(string)
      bucket_namespace    = optional(string)
      bucket_prefix       = optional(string)
      force_destroy       = optional(bool)
      object_lock_enabled = optional(bool)

      tags = optional(map(string))
    }))

    bucket_abac = optional(object({
      region                = optional(string)
      bucket                = optional(string)
      expected_bucket_owner = optional(string)

      abac_status = object({
        status = string
      })
    }))

    bucket_accelerate_configuration = optional(object({
      region                = optional(string)
      bucket                = optional(string)
      expected_bucket_owner = optional(string)
      status                = string
    }))

    bucket_acl = optional(object({
      region                = optional(string)
      bucket                = optional(string)
      acl                   = optional(string)
      expected_bucket_owner = optional(string)

      access_control_policy = optional(object({
        grant = list(object({
          permission = string

          grantee = object({
            email_address = optional(string)
            id            = optional(string)
            type          = string
            uri           = optional(string)
          })
        }))

        owner = object({
          id           = string
          display_name = optional(string)
        })
      }))
    }))

    bucket_analytics_configuration = optional(object({
      region = optional(string)
      name   = string

      bucket = optional(string)
      filter = optional(object({
        prefix = optional(string)
        tags   = optional(map(string))
      }))

      storage_class_analysis = optional(object({
        data_export = object({
          output_schema_version = optional(string)
          destination = object({
            s3_bucket_destination = object({
              bucket_arn        = string
              bucket_account_id = optional(string)
              format            = optional(string)
              prefix            = optional(string)
            })
          })
        })
      }))
    }))

    bucket_analytics_configurations = optional(map(object({
      region = optional(string)
      name   = string

      bucket = optional(string)
      filter = optional(object({
        prefix = optional(string)
        tags   = optional(map(string))
      }))

      storage_class_analysis = optional(object({
        data_export = object({
          output_schema_version = optional(string)
          destination = object({
            s3_bucket_destination = object({
              bucket_arn        = string
              bucket_account_id = optional(string)
              format            = optional(string)
              prefix            = optional(string)
            })
          })
        })
      }))
    })), {})

    bucket_cors_configuration = optional(object({
      region                = optional(string)
      bucket                = optional(string)
      expected_bucket_owner = optional(string)

      cors_rule = set(object({
        allowed_headers = optional(set(string))
        allowed_methods = set(string)
        allowed_origins = set(string)
        expose_headers  = optional(set(string))
        id              = optional(string)
        max_age_seconds = optional(number)
      }))
    }))

    bucket_intelligent_tiering_configurations = optional(map(object({
      region = optional(string)
      bucket = optional(string)
      name   = string
      status = optional(string)

      filter = optional(object({
        prefix = optional(string)
        tags   = optional(map(string))
      }))

      tiering = set(object({
        access_tier = string
        days        = number
      }))
    })), {})

    bucket_inventory = optional(object({
      region                   = optional(string)
      name                     = string
      included_object_versions = string

      schedule = object({
        frequency = string
      })

      destination = object({
        bucket = object({
          bucket_arn = string
          format     = string
          account_id = optional(string)
          prefix     = optional(string)
          encryption = optional(object({
            sse_kms = optional(object({
              key_id                  = optional(string)
              kms_key_custom_name     = optional(string)
              replica_key_custom_name = optional(string)
            }))

            sse_s3 = optional(object({}))
          }))
        })
      })

      bucket  = optional(string)
      enabled = optional(bool)

      filter = optional(object({
        prefix = optional(string)
      }))

      optional_fields = optional(list(string))
    }))

    bucket_inventories = optional(map(object({
      region                   = optional(string)
      name                     = string
      included_object_versions = string

      schedule = object({
        frequency = string
      })

      destination = object({
        bucket = object({
          bucket_arn = string
          format     = string
          account_id = optional(string)
          prefix     = optional(string)
          encryption = optional(object({
            sse_kms = optional(object({
              key_id                  = optional(string)
              kms_key_custom_name     = optional(string)
              replica_key_custom_name = optional(string)
            }))

            sse_s3 = optional(object({}))
          }))
        })
      })

      bucket  = optional(string)
      enabled = optional(bool)

      filter = optional(object({
        prefix = optional(string)
      }))

      optional_fields = optional(list(string))
    })), {})

    bucket_lifecycle_configuration = optional(object({
      region                                 = optional(string)
      bucket                                 = optional(string)
      expected_bucket_owner                  = optional(string)
      transition_default_minimum_object_size = optional(string)

      rule = list(object({
        abort_incomplete_multipart_upload = optional(object({
          days_after_initiation = optional(number)
        }))

        expiration = optional(object({
          date                         = optional(string)
          days                         = optional(number)
          expired_object_delete_marker = optional(bool)
        }))

        filter = optional(object({
          and = optional(object({
            object_size_greater_than = optional(number)
            object_size_less_than    = optional(number)
            prefix                   = optional(string)
            tags                     = optional(map(string))
          }))

          object_size_greater_than = optional(number)
          object_size_less_than    = optional(number)
          prefix                   = optional(string)

          tag = optional(list(object({
            key   = string
            value = string
          })))
        }))

        id     = string
        prefix = optional(string)

        noncurrent_version_expiration = optional(object({
          newer_noncurrent_versions = optional(number)
          noncurrent_days           = number
        }))

        noncurrent_version_transition = optional(list(object({
          newer_noncurrent_versions = optional(number)
          noncurrent_days           = number
          storage_class             = string
        })))

        status = string

        transition = optional(list(object({
          date          = optional(string)
          days          = optional(number)
          storage_class = string
        })))
      }))

      timeouts = optional(object({
        create = optional(string)
        update = optional(string)
      }))
    }))

    bucket_logging = optional(object({
      region                = optional(string)
      bucket                = optional(string)
      expected_bucket_owner = optional(string)
      target_bucket         = string

      target_grant = optional(set(object({
        grantee = object({
          email_address = optional(string)
          id            = optional(string)
          type          = string
          uri           = optional(string)
        })

        permission = string
      })))

      target_object_key_format = optional(object({
        partitioned_prefix = optional(object({
          partition_date_source = string
        }))

        simple_prefix = optional(object({}))
      }))

      target_prefix = string
    }))

    bucket_metadata_configuration = optional(object({
      region                = optional(string)
      bucket                = optional(string)
      expected_bucket_owner = optional(string)

      metadata_configuration = object({
        inventory_table_configuration = object({
          configuration_state = string
          encryption_configuration = optional(object({
            kms_key_arn             = optional(string)
            kms_key_custom_name     = optional(string)
            replica_key_custom_name = optional(string)
            sse_algorithm           = string
          }))
        })

        journal_table_configuration = object({
          encryption_configuration = optional(object({
            kms_key_arn             = optional(string)
            kms_key_custom_name     = optional(string)
            replica_key_custom_name = optional(string)
            sse_algorithm           = string
          }))

          record_expiration = object({
            days       = optional(number)
            expiration = string
          })
        })
      })

      timeouts = optional(object({
        create = optional(string)
      }))
    }))

    bucket_metrics = optional(map(object({
      region = optional(string)
      bucket = optional(string)
      name   = string

      filter = optional(object({
        access_point = optional(string)
        prefix       = optional(string)
        tags         = optional(map(string))
      }))
    })), {})

    bucket_notification = optional(object({
      region      = optional(string)
      bucket      = optional(string)
      eventbridge = optional(bool)

      lambda_function = optional(list(object({
        events              = set(string)
        filter_prefix       = optional(string)
        filter_suffix       = optional(string)
        id                  = optional(string)
        lambda_function_arn = optional(string)
      })))

      queue = optional(list(object({
        events        = set(string)
        filter_prefix = optional(string)
        filter_suffix = optional(string)
        id            = optional(string)
        queue_arn     = string
      })))

      topic = optional(list(object({
        events        = set(string)
        filter_prefix = optional(string)
        filter_suffix = optional(string)
        id            = optional(string)
        topic_arn     = string
      })))
    }))

    bucket_object_lock_configuration = optional(object({
      region                = optional(string)
      bucket                = optional(string)
      expected_bucket_owner = optional(string)
      object_lock_enabled   = optional(string)

      rule = optional(object({
        default_retention = object({
          days  = optional(number)
          mode  = string
          years = optional(number)
        })
      }))

      token = optional(string)
    }))

    bucket_ownership_controls = optional(object({
      region = optional(string)
      rule = object({
        object_ownership = string
      })
      bucket = optional(string)
    }))

    bucket_policy = optional(object({
      region = optional(string)
      policy = string
      bucket = optional(string)
    }))

    bucket_public_access_block = optional(object({
      region                  = optional(string)
      bucket                  = optional(string)
      block_public_acls       = optional(bool)
      block_public_policy     = optional(bool)
      ignore_public_acls      = optional(bool)
      restrict_public_buckets = optional(bool)
      skip_destroy            = optional(bool)
    }))

    bucket_replication_configuration = optional(object({
      region           = optional(string)
      role             = optional(string)
      role_custom_name = optional(string)
      bucket           = optional(string)
      token            = optional(string)

      rule = list(object({
        delete_marker_replication = optional(object({
          status = string
        }))
        destination = object({
          access_control_translation = optional(object({
            owner = string
          }))

          account = optional(string)
          bucket  = string

          encryption_configuration = optional(object({
            replica_kms_key_id          = optional(string)
            replica_kms_key_custom_name = optional(string)
            replica_key_custom_name     = optional(string)
          }))

          metrics = optional(object({
            event_threshold = optional(object({
              minutes = number
            }))

            status = string
          }))

          replication_time = optional(object({
            status = string

            time = object({
              minutes = number
            })
          }))

          storage_class = optional(string)
        })

        existing_object_replication = optional(object({
          status = string
        }))

        filter = optional(object({
          and = optional(object({
            prefix = optional(string)
            tags   = optional(map(string))
          }))

          prefix = optional(string)

          tag = optional(object({
            key   = string
            value = string
          }))
        }))

        id       = optional(string)
        prefix   = optional(string)
        priority = optional(string)

        source_selection_criteria = optional(object({
          replica_modifications = optional(object({
            status = string
          }))
          sse_kms_encrypted_objects = optional(object({
            status = string
          }))
        }))

        status = string
      }))
    }))

    bucket_request_payment_configuration = optional(object({
      region                = optional(string)
      bucket                = optional(string)
      expected_bucket_owner = optional(string)
      payer                 = string
    }))

    bucket_server_side_encryption_configuration = optional(object({
      region                = optional(string)
      bucket                = optional(string)
      expected_bucket_owner = optional(string)

      rule = object({
        apply_server_side_encryption_by_default = optional(object({
          sse_algorithm              = string
          kms_master_key_id          = optional(string)
          kms_master_key_custom_name = optional(string)
          replica_key_custom_name    = optional(string)
        }))

        blocked_encryption_types = optional(list(string))
        bucket_key_enabled       = optional(bool)
      })
    }))

    bucket_versioning = optional(object({
      region = optional(string)
      versioning_configuration = object({
        status     = string
        mfa_delete = optional(string)
      })

      bucket                = optional(string)
      expected_bucket_owner = optional(string)
      mfa                   = optional(string)
    }))

    bucket_website_configuration = optional(object({
      region = optional(string)
      bucket = optional(string)
      error_document = optional(object({
        key = string
      }))

      expected_bucket_owner = optional(string)

      index_document = optional(object({
        suffix = string
      }))

      redirect_all_requests_to = optional(object({
        host_name = string
        protocol  = optional(string)
      }))

      routing_rule = optional(object({
        condition = optional(object({
          http_error_code_returned_equals = optional(number)
          key_prefix_equals               = optional(string)
        }))

        redirect = object({
          host_name               = optional(string)
          http_redirect_code      = optional(number)
          protocol                = optional(string)
          replace_key_prefix_with = optional(string)
          replace_key_with        = optional(string)
        })
      }))

      routing_rules = optional(string)
    }))

    directory_bucket = optional(object({
      region          = optional(string)
      bucket          = string
      data_redundancy = optional(string)
      force_destroy   = optional(bool)

      location = object({
        name = string
        type = optional(string)
      })

      type = optional(string)
      tags = optional(map(string))
    }))

    directory_bucket_access_point_scopes = optional(map(object({
      region                   = optional(string)
      account_id               = optional(string)
      name                     = optional(string)
      access_point_custom_name = optional(string)

      scope = object({
        permissions = optional(list(string))
        prefixes    = optional(list(string))
      })
    })), {})

    multi_region_access_points = optional(map(object({
      region     = optional(string)
      account_id = optional(string)

      details = object({
        name = string
        public_access_block = optional(object({
          block_public_acls       = optional(bool)
          block_public_policy     = optional(bool)
          ignore_public_acls      = optional(bool)
          restrict_public_buckets = optional(bool)
        }))

        region = set(object({
          bucket            = optional(string)
          bucket_account_id = optional(string)
        }))
      })

      timeouts = optional(object({
        create = optional(string)
        delete = optional(string)
      }))
    })), {})

    multi_region_access_point_policies = optional(map(object({
      region     = optional(string)
      account_id = optional(string)

      details = object({
        name                                  = optional(string)
        multi_region_access_point_custom_name = optional(string)
        policy                                = optional(string)
        iam_custom_name                       = optional(string)
        policy_custom_name                    = optional(string)
      })

      timeouts = optional(object({
        create = optional(string)
        update = optional(string)
      }))
    })), {})

    multi_region_access_point_routes = optional(map(object({
      region                                = optional(string)
      account_id                            = optional(string)
      mrap                                  = optional(string)
      multi_region_access_point_custom_name = optional(string)

      route = set(object({
        bucket                  = string
        region                  = string
        traffic_dial_percentage = number
      }))
    })), {})

    objects = optional(map(object({
      region                        = optional(string)
      key                           = string
      bucket                        = optional(string)
      acl                           = optional(string)
      bucket_key_enabled            = optional(bool)
      cache_control                 = optional(string)
      checksum_algorithm            = optional(string)
      content_base64                = optional(string)
      content_disposition           = optional(string)
      content_encoding              = optional(string)
      content_language              = optional(string)
      content_type                  = optional(string)
      content                       = optional(string)
      etag                          = optional(string)
      force_destroy                 = optional(bool)
      kms_key_id                    = optional(string)
      kms_key_custom_name           = optional(string)
      replica_key_custom_name       = optional(string)
      metadata                      = optional(map(string))
      object_lock_legal_hold_status = optional(string)
      object_lock_mode              = optional(string)
      object_lock_retain_until_date = optional(string)

      override_provider = optional(object({
        default_tags = optional(object({
          tags = optional(map(string))
        }))
      }))

      server_side_encryption = optional(string)
      source_hash            = optional(string)
      source_to_file         = optional(string)
      storage_class          = optional(string)
      website_redirect       = optional(string)
      tags                   = optional(map(string))
    })), {})

    storage_lens_configurations = optional(map(object({
      region     = optional(string)
      config_id  = string
      account_id = optional(string)

      storage_lens_configuration = object({
        account_level = object({
          activity_metrics = optional(object({
            enabled = optional(bool)
          }))

          advanced_cost_optimization_metrics = optional(object({
            enabled = optional(bool)
          }))

          advanced_data_protection_metrics = optional(object({
            enabled = optional(bool)
          }))

          advanced_performance_metrics = optional(object({
            enabled = optional(bool)
          }))

          bucket_level = object({
            activity_metrics = optional(object({
              enabled = optional(bool)
            }))

            advanced_cost_optimization_metrics = optional(object({
              enabled = optional(bool)
            }))

            advanced_data_protection_metrics = optional(object({
              enabled = optional(bool)
            }))

            advanced_performance_metrics = optional(object({
              enabled = optional(bool)
            }))

            detailed_status_code_metrics = optional(object({
              enabled = optional(bool)
            }))

            prefix_level = optional(object({
              storage_metrics = object({
                enabled = optional(bool)
                selection_criteria = optional(object({
                  delimiter                    = optional(string)
                  max_depth                    = optional(number)
                  min_storage_bytes_percentage = optional(number)
                }))
              })
            }))
          })

          detailed_status_code_metrics = optional(object({
            enabled = optional(bool)
          }))
        })

        aws_org = optional(object({
          arn = string
        }))

        data_export = optional(object({
          cloud_watch_metrics = optional(object({
            enabled = bool
          }))

          s3_bucket_destination = optional(object({
            account_id = string
            arn        = optional(string)
            encryption = optional(object({
              sse_kms = optional(object({
                key_id                  = optional(string)
                kms_key_custom_name     = optional(string)
                replica_key_custom_name = optional(string)
              }))

              sse_s3 = optional(object({}))
            }))

            format                = string
            output_schema_version = string
            prefix                = optional(string)
          }))

          storage_lens_table_destination = optional(object({
            enabled = bool
            encryption = optional(object({
              sse_kms = optional(object({
                key_id                  = optional(string)
                kms_key_custom_name     = optional(string)
                replica_key_custom_name = optional(string)
              }))

              sse_s3 = optional(object({}))
            }))
          }))
        }))

        expanded_prefixes_data_export = optional(object({
          s3_bucket_destination = optional(object({
            account_id = string
            arn        = optional(string)
            encryption = optional(object({
              sse_kms = optional(object({
                key_id                  = optional(string)
                kms_key_custom_name     = optional(string)
                replica_key_custom_name = optional(string)
              }))

              sse_s3 = optional(object({}))
            }))

            format                = string
            output_schema_version = string
            prefix                = optional(string)
          }))

          storage_lens_table_destination = optional(object({
            enabled = bool
            encryption = optional(object({
              sse_kms = optional(object({
                key_id                  = optional(string)
                kms_key_custom_name     = optional(string)
                replica_key_custom_name = optional(string)
              }))

              sse_s3 = optional(object({}))
            }))
          }))
        }))

        enabled = bool
        exclude = optional(object({
          buckets = optional(set(string))
          regions = optional(set(string))
        }))

        include = optional(object({
          buckets = optional(set(string))
          regions = optional(set(string))
        }))

        prefix_delimiter = optional(string)
      })

      tags = optional(map(string))
    })), {})
  }))

  description = "Keyed collection of s3 definitions"
  default     = {}
}

variable "iam_map" {
  type = map(object({
    account_alias = optional(object({
      account_alias = string
    }))

    account_password_policy = optional(object({
      allow_users_to_change_password = optional(bool)
      hard_expiry                    = optional(bool)
      max_password_age               = optional(number)
      minimum_password_length        = optional(number)
      password_reuse_prevention      = optional(number)
      require_lowercase_characters   = optional(bool)
      require_numbers                = optional(bool)
      require_symbols                = optional(bool)
      require_uppercase_characters   = optional(bool)
    }))

    role = optional(object({
      assume_role_policy                      = optional(string)
      assume_role_policy_document_custom_name = optional(string)
      description                             = optional(string)
      force_detach_policies                   = optional(bool)
      inline_policy = optional(set(object({
        name   = string
        policy = string
      })), [])

      managed_policy_arns              = optional(set(string))
      max_session_duration             = optional(number)
      name                             = optional(string)
      name_prefix                      = optional(string)
      path                             = optional(string)
      permissions_boundary             = optional(string)
      permissions_boundary_custom_name = optional(string)

      tags = optional(map(string))
    }))

    policy_documents = optional(map(object({
      override_policy_documents = optional(list(string))
      policy_id                 = optional(string)
      source_policy_documents   = optional(list(string))
      policy_version            = optional(string)

      statement = optional(list(object({
        actions       = optional(set(string))
        effect        = optional(string)
        not_actions   = optional(set(string))
        not_resources = optional(set(string))
        resources     = optional(set(string))
        sid           = optional(string)

        condition = optional(set(object({
          test     = string
          variable = string
          values   = list(any)
        })), [])

        principals = optional(set(object({
          identifiers                = set(string)
          saml_provider_custom_names = optional(set(string), [])
          type                       = string
        })), [])

        not_principals = optional(set(object({
          identifiers                = set(string)
          saml_provider_custom_names = optional(set(string), [])
          type                       = string
        })), [])
      })), [])
    })), {})

    role_policies = optional(map(object({
      name                        = optional(string)
      name_prefix                 = optional(string)
      policy                      = optional(string)
      policy_document_custom_name = optional(string)
      role                        = optional(string)
    })), {})

    role_policy_attachments = optional(list(object({
      custom_name        = optional(string)
      policy_arn         = optional(string)
      policy_custom_name = optional(string)
      role               = optional(string)
    })), [])

    role_policies_exclusive = optional(object({
      role_name           = optional(string)
      policy_names        = set(string)
      policy_custom_names = optional(set(string), [])
    }))

    instance_profile = optional(object({
      name        = optional(string)
      name_prefix = optional(string)
      path        = optional(string)
      role        = optional(string)
      tags        = optional(map(string))
    }))

    policy_attachments_exclusive = optional(object({
      policy_arns         = set(string)
      policy_custom_names = optional(set(string), [])
      role_name           = optional(string)
    }))

    policies = optional(map(object({
      policy                            = optional(string)
      policy_custom_name                = optional(string)
      delay_after_policy_creation_in_ms = optional(number)
      description                       = optional(string)
      name                              = optional(string)
      name_prefix                       = optional(string)
      path                              = optional(string)
      tags                              = optional(map(string))
    })), {})

    users = optional(map(object({
      name                             = string
      path                             = optional(string)
      permissions_boundary             = optional(string)
      permissions_boundary_custom_name = optional(string)
      force_destroy                    = optional(bool)
      tags                             = optional(map(string))
    })), {})

    user_login_profiles = optional(map(object({
      user                    = optional(string)
      user_custom_name        = optional(string)
      pgp_key                 = optional(string)
      password_length         = optional(number)
      password_reset_required = optional(bool)
    })), {})

    access_keys = optional(map(object({
      user             = optional(string)
      user_custom_name = optional(string)
      pgp_key          = optional(string)
      status           = optional(string)
    })), {})

    user_ssh_keys = optional(map(object({
      username         = optional(string)
      user_custom_name = optional(string)
      encoding         = string
      public_key       = string
      status           = optional(string)
    })), {})

    groups = optional(map(object({
      name = string
      path = optional(string)
    })), {})

    user_policies = optional(map(object({
      name                        = optional(string)
      name_prefix                 = optional(string)
      policy                      = optional(string)
      policy_document_custom_name = optional(string)
      user                        = optional(string)
      user_custom_name            = optional(string)
    })), {})

    user_policy_attachments = optional(map(object({
      user               = optional(string)
      user_custom_name   = optional(string)
      policy_arn         = optional(string)
      policy_custom_name = optional(string)
    })), {})

    user_policies_exclusive = optional(map(object({
      user_name           = optional(string)
      user_custom_name    = optional(string)
      policy_names        = set(string)
      policy_custom_names = optional(set(string), [])
    })), {})

    user_policy_attachments_exclusive = optional(map(object({
      user_name           = optional(string)
      user_custom_name    = optional(string)
      policy_arns         = set(string)
      policy_custom_names = optional(set(string), [])
    })), {})

    group_policies = optional(map(object({
      name                        = optional(string)
      name_prefix                 = optional(string)
      policy                      = optional(string)
      policy_document_custom_name = optional(string)
      group                       = optional(string)
      group_custom_name           = optional(string)
    })), {})

    group_policy_attachments = optional(map(object({
      group              = optional(string)
      group_custom_name  = optional(string)
      policy_arn         = optional(string)
      policy_custom_name = optional(string)
    })), {})

    group_policies_exclusive = optional(map(object({
      group_name          = optional(string)
      group_custom_name   = optional(string)
      policy_names        = set(string)
      policy_custom_names = optional(set(string), [])
    })), {})

    group_policy_attachments_exclusive = optional(map(object({
      group_name          = optional(string)
      group_custom_name   = optional(string)
      policy_arns         = set(string)
      policy_custom_names = optional(set(string), [])
    })), {})

    group_memberships = optional(map(object({
      name              = string
      users             = set(string)
      user_custom_names = optional(set(string), [])
      group             = optional(string)
      group_custom_name = optional(string)
    })), {})

    user_group_memberships = optional(map(object({
      user   = optional(string)
      groups = optional(set(string), [])
    })), {})

    openid_connect_providers = optional(map(object({
      url             = string
      client_id_list  = set(string)
      thumbprint_list = optional(list(string))
      tags            = optional(map(string))
    })), {})

    saml_providers = optional(map(object({
      name                   = string
      saml_metadata_document = string
      tags                   = optional(map(string))
    })), {})

    service_linked_roles = optional(map(object({
      aws_service_name = string
      custom_suffix    = optional(string)
      description      = optional(string)
      tags             = optional(map(string))
    })), {})
  }))

  description = "Keyed collection of iam definitions"
  default     = {}
}

variable "security_group_map" {
  type = map(object({
    security_group = optional(object({
      region      = optional(string)
      description = optional(string)

      egress = optional(list(object({
        from_port        = number
        to_port          = number
        protocol         = string
        cidr_blocks      = optional(list(string))
        description      = optional(string)
        ipv6_cidr_blocks = optional(list(string))
        prefix_list_ids  = optional(list(string))
        security_groups  = optional(list(string))
        self             = optional(bool)
      })), [])

      ingress = optional(list(object({
        from_port        = number
        to_port          = number
        protocol         = string
        cidr_blocks      = optional(list(string))
        description      = optional(string)
        ipv6_cidr_blocks = optional(list(string))
        prefix_list_ids  = optional(list(string))
        security_groups  = optional(list(string))
        self             = optional(bool)
      })), [])

      name_prefix            = optional(string)
      name                   = optional(string)
      revoke_rules_on_delete = optional(bool)
      vpc_id                 = optional(string)

      timeouts = optional(object({
        create = optional(string)
        delete = optional(string)
      }))

      tags = optional(map(string))
    }))

    rules = optional(list(object({
      region                    = optional(string)
      from_port                 = number
      protocol                  = string
      to_port                   = number
      type                      = string
      security_group_id         = optional(string)
      cidr_blocks               = optional(list(string))
      description               = optional(string)
      ipv6_cidr_blocks          = optional(list(string))
      prefix_list_ids           = optional(list(string))
      self                      = optional(bool)
      source_security_group_id  = optional(string)
      source_security_group_ids = optional(list(string), [])

      timeouts = optional(object({
        create = optional(string)
      }))
    })), [])

    egress_rules = optional(map(object({
      # Defaults to egress; ingress_egress and egress_ingress create both directions.
      type                          = optional(string, "egress")
      region                        = optional(string)
      ip_protocol                   = string
      security_group_id             = optional(string)
      cidr_ipv4                     = optional(string)
      cidr_ipv6                     = optional(string)
      description                   = optional(string)
      from_port                     = optional(number)
      prefix_list_id                = optional(string)
      referenced_security_group_id  = optional(string)
      referenced_security_group_ids = optional(list(string), [])
      self                          = optional(bool, false)
      tags                          = optional(map(string))
      to_port                       = optional(number)
    })), {})

    ingress_rules = optional(map(object({
      # Defaults to ingress; ingress_egress and egress_ingress create both directions.
      type                          = optional(string, "ingress")
      region                        = optional(string)
      ip_protocol                   = string
      security_group_id             = optional(string)
      cidr_ipv4                     = optional(string)
      cidr_ipv6                     = optional(string)
      description                   = optional(string)
      from_port                     = optional(number)
      prefix_list_id                = optional(string)
      referenced_security_group_id  = optional(string)
      referenced_security_group_ids = optional(list(string), [])
      self                          = optional(bool, false)
      tags                          = optional(map(string))
      to_port                       = optional(number)
    })), {})

    rules_exclusive = optional(object({
      # List bidirectional rule keys in both custom-name sets to retain both directions.
      region                    = optional(string)
      security_group_id         = optional(string)
      egress_rule_ids           = set(string)
      egress_rule_custom_names  = optional(set(string), [])
      ingress_rule_ids          = set(string)
      ingress_rule_custom_names = optional(set(string), [])
    }))

    vpc_associations = optional(map(object({
      region            = optional(string)
      security_group_id = optional(string)
      vpc_id            = string

      timeouts = optional(object({
        create = optional(string)
        delete = optional(string)
      }))
    })), {})
  }))

  description = "Keyed collection of security-group definitions"
  default     = {}
}
