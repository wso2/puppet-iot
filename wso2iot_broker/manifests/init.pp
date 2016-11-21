# ------------------------------------------------------------------------------
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
# ------------------------------------------------------------------------------

# Manages WSO2 Message Broker deployment
class wso2iot_broker (
  # wso2iot_broker specific configuration data
  $mb_thrift_server       = $wso2iot_broker::params::mb_thrift_server,
  $mb_thrift_port         = $wso2iot_broker::params::mb_thrift_port,
  $metrics_datasources    = $wso2iot_broker::params::metrics_datasources,

  $packages               = $wso2iot_broker::params::packages,
  $template_list          = $wso2iot_broker::params::template_list,
  $file_list              = $wso2iot_broker::params::file_list,
  $patch_list             = $wso2iot_broker::params::patch_list,
  $cert_list              = $wso2iot_broker::params::cert_list,
  $system_file_list       = $wso2iot_broker::params::system_file_list,
  $directory_list         = $wso2iot_broker::params::directory_list,
  $hosts_mapping          = $wso2iot_broker::params::hosts_mapping,
  $java_home              = $wso2iot_broker::params::java_home,
  $java_prefs_system_root = $wso2iot_broker::params::java_prefs_system_root,
  $java_prefs_user_root   = $wso2iot_broker::params::java_prefs_user_root,
  $vm_type                = $wso2iot_broker::params::vm_type,
  $wso2_user              = $wso2iot_broker::params::wso2_user,
  $wso2_group             = $wso2iot_broker::params::wso2_group,
  $product_name           = $wso2iot_broker::params::product_name,
  $product_version        = $wso2iot_broker::params::product_version,
  $platform_version       = $wso2iot_broker::params::platform_version,
  $carbon_home_symlink    = $wso2iot_broker::params::carbon_home_symlink,
  $remote_file_url        = $wso2iot_broker::params::remote_file_url,
  $maintenance_mode       = $wso2iot_broker::params::maintenance_mode,
  $install_mode           = $wso2iot_broker::params::install_mode,
  $install_dir            = $wso2iot_broker::params::install_dir,
  $pack_dir               = $wso2iot_broker::params::pack_dir,
  $pack_filename          = $wso2iot_broker::params::pack_filename,
  $pack_extracted_dir     = $wso2iot_broker::params::pack_extracted_dir,
  $patches_dir            = $wso2iot_broker::params::patches_dir,
  $service_name           = $wso2iot_broker::params::service_name,
  $service_template       = $wso2iot_broker::params::service_template,
  $ipaddress              = $wso2iot_broker::params::ipaddress,
  $enable_secure_vault    = $wso2iot_broker::params::enable_secure_vault,
  $secure_vault_configs   = $wso2iot_broker::params::secure_vault_configs,
  $key_stores             = $wso2iot_broker::params::key_stores,
  $carbon_home            = $wso2iot_broker::params::carbon_home,
  $pack_file_abs_path     = $wso2iot_broker::params::pack_file_abs_path,

  # Templated configuration parameters
  $master_datasources     = $wso2iot_broker::params::master_datasources,
  $registry_mounts        = $wso2iot_broker::params::registry_mounts,
  $hostname               = $wso2iot_broker::params::hostname,
  $mgt_hostname           = $wso2iot_broker::params::mgt_hostname,
  $worker_node            = $wso2iot_broker::params::worker_node,
  $usermgt_datasource     = $wso2iot_broker::params::usermgt_datasource,
  $local_reg_datasource   = $wso2iot_broker::params::local_reg_datasource,
  $clustering             = $wso2iot_broker::params::clustering,
  $dep_sync               = $wso2iot_broker::params::dep_sync,
  $ports                  = $wso2iot_broker::params::ports,
  $jvm                    = $wso2iot_broker::params::jvm,
  $fqdn                   = $wso2iot_broker::params::fqdn,
  $sso_authentication     = $wso2iot_broker::params::sso_authentication,
  $user_management        = $wso2iot_broker::params::user_management,
  oauth2_based_mqtt_authenticator = $wso2iot_broker::params::oauth2_based_mqtt_authenticator

) inherits wso2iot_broker::params {

  validate_string($mb_thrift_server)
  validate_integer($mb_thrift_port)
  validate_hash($metrics_datasources)

  validate_hash($master_datasources)
  validate_string($hostname)
  validate_string($mgt_hostname)
  validate_bool($worker_node)
  validate_string($usermgt_datasource)
  validate_string($local_reg_datasource)
  validate_hash($clustering)
  validate_hash($dep_sync)
  validate_hash($ports)
  validate_hash($jvm)
  validate_string($fqdn)
  validate_hash($sso_authentication)
  validate_hash($user_management)
  validate_hash($oauth2_based_mqtt_authenticator)


  class { '::wso2base':
    packages               => $packages,
    template_list          => $template_list,
    file_list              => $file_list,
    patch_list             => $patch_list,
    cert_list              => $cert_list,
    system_file_list       => $system_file_list,
    directory_list         => $directory_list,
    hosts_mapping          => $hosts_mapping,
    java_home              => $java_home,
    java_prefs_system_root => $java_prefs_system_root,
    java_prefs_user_root   => $java_prefs_user_root,
    vm_type                => $vm_type,
    wso2_user              => $wso2_user,
    wso2_group             => $wso2_group,
    product_name           => $product_name,
    product_version        => $product_version,
    platform_version       => $platform_version,
    carbon_home_symlink    => $carbon_home_symlink,
    remote_file_url        => $remote_file_url,
    maintenance_mode       => $maintenance_mode,
    install_mode           => $install_mode,
    install_dir            => $install_dir,
    pack_dir               => $pack_dir,
    pack_filename          => $pack_filename,
    pack_extracted_dir     => $pack_extracted_dir,
    patches_dir            => $patches_dir,
    service_name           => $service_name,
    service_template       => $service_template,
    ipaddress              => $ipaddress,
    enable_secure_vault    => $enable_secure_vault,
    secure_vault_configs   => $secure_vault_configs,
    key_stores             => $key_stores,
    carbon_home            => $carbon_home,
    pack_file_abs_path     => $pack_file_abs_path
  }

  contain wso2base
  contain wso2base::system
  contain wso2base::clean
  contain wso2base::install
  contain wso2base::configure
  contain wso2base::service

  Class['::wso2base'] -> Class['::wso2base::system']
  -> Class['::wso2base::clean'] -> Class['::wso2base::install']
  -> Class['::wso2base::configure'] ~> Class['::wso2base::service']
}
