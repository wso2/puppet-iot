#----------------------------------------------------------------------------
# Copyright (c) 2016, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#----------------------------------------------------------------------------

# Manages WSO2 Application Server deployment
class wso2iot inherits wso2base {
  $analytics_host = hiera('wso2::analytics_host')
  $analytics_https_port = hiera('wso2::analytics_https_port')
  $mqtt_broker_host = hiera('wso2::mqtt_broker_host')
  $mqtt_broker_port = hiera('wso2::mqtt_broker_port')
  $core_host = hiera('wso2::core_host')
  $core_https_port = hiera('wso2::core_https_port')
  $iot_mgt_https_port = hiera('wso2::iot_mgt_https_port')
  $keymanager_host = hiera('wso2::keymanager_host')
  $keymanager_https_port = hiera('wso2::keymanager_https_port')
  $gateway_host = hiera('wso2::gateway_host')
  $gateway_https_port = hiera('wso2::gateway_https_port')
  $gateway_http_port = hiera('wso2::gateway_http_port')
  $apimpublisher_host = hiera('wso2::apimpublisher_host')
  $apimpublisher_https_port = hiera('wso2::apimpublisher_https_port')
  $apimstore_host = hiera('wso2::apimstore_host')
  $apimstore_https_port = hiera('wso2::apimstore_https_port')
  $cloudmgt_host = hiera('wso2::cloudmgt_host')
  $appcloud_host = hiera('wso2::appcloud_host')
  $dep_sync = hiera('wso2::dep_sync', { })
  $devicemgt_sso = hiera('wso2::devicemgt_sso', { })
  $mailto = hiera('wso2::mailto', { })
  $cdm_datasources = hiera('wso2::cdm_datasources')
  $windows_datasources = hiera('wso2::windows_datasources')
  $android_datasources = hiera('wso2::android_datasources')
  $ios_datasources = hiera('wso2::ios_datasources')
  $user_management = hiera('wso2::user_management')
  $tenant_managers = hiera('wso2::tenant_managers')
  $is_datasource = hiera('wso2::is_datasource')
  $ldap = hiera('wso2::ldap', {})
  $policy_monitoring_task_frequency = hiera('wso2::policy_monitoring_task_frequency')
  $policy_monitoring_task_enabled = hiera('wso2::policy_monitoring_task_enabled')
  $device_monitoring_task_frequency = hiera('wso2::device_monitoring_task_frequency')
  $device_monitoring_task_enabled = hiera('wso2::device_monitoring_task_enabled')

  $ios_key_alias = hiera('wso2::ios_key_alias')
  $ios_key_password = hiera('wso2::ios_key_password')
  $ios_ca_alias = hiera('wso2::ios_ca_alias')
  $ios_ra_alias = hiera('wso2::ios_ra_alias')
  $ios_ca_password = hiera('wso2::ios_ca_password')
  $ios_ra_password = hiera('wso2::ios_ra_password')

  wso2base::server { $wso2base::carbon_home:
    maintenance_mode    => $wso2base::maintenance_mode,
    pack_filename       => $wso2base::pack_filename,
    pack_dir            => $wso2base::pack_dir,
    carbon_home_symlink => $wso2base::carbon_home_symlink,
    install_mode        => $wso2base::install_mode,
    install_dir         => $wso2base::install_dir,
    pack_extracted_dir  => $wso2base::pack_extracted_dir,
    wso2_user           => $wso2base::wso2_user,
    wso2_group          => $wso2base::wso2_group,
    patches_dir         => $wso2base::patches_dir,
    service_name        => $wso2base::service_name,
    service_template    => $wso2base::service_template,
    hosts_template      => $wso2base::hosts_template,
    template_list       => $wso2base::template_list,
    directory_list      => $wso2base::directory_list,
    file_list           => $wso2base::file_list,
    system_file_list    => $wso2base::system_file_list,
    enable_secure_vault => $wso2base::enable_secure_vault,
    key_store_password  => $wso2base::key_store_password
  }
}
