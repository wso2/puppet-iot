
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

# Manages WSO2 Application Server deployment
class wso2iot_core (
  # wso2iot specific configuration data
  $iot_wsdl_epr_prefix          = $wso2iot_core::params::iot_wsdl_epr_prefix,

  $packages               = $wso2iot_core::params::packages,
  $template_list          = $wso2iot_core::params::template_list,
  $file_list              = $wso2iot_core::params::file_list,
  $patch_list             = $wso2iot_core::params::patch_list,
  $cert_list              = $wso2iot_core::params::cert_list,
  $system_file_list       = $wso2iot_core::params::system_file_list,
  $directory_list         = $wso2iot_core::params::directory_list,
  $hosts_mapping          = $wso2iot_core::params::hosts_mapping,
  $java_home              = $wso2iot_core::params::java_home,
  $java_prefs_system_root = $wso2iot_core::params::java_prefs_system_root,
  $java_prefs_user_root   = $wso2iot_core::params::java_prefs_user_root,
  $vm_type                = $wso2iot_core::params::vm_type,
  $wso2_user              = $wso2iot_core::params::wso2_user,
  $wso2_group             = $wso2iot_core::params::wso2_group,
  $product_name           = $wso2iot_core::params::product_name,
  $product_version        = $wso2iot_core::params::product_version,
  $platform_version       = $wso2iot_core::params::platform_version,
  $carbon_home_symlink    = $wso2iot_core::params::carbon_home_symlink,
  $remote_file_url        = $wso2iot_core::params::remote_file_url,
  $maintenance_mode       = $wso2iot_core::params::maintenance_mode,
  $install_mode           = $wso2iot_core::params::install_mode,
  $install_dir            = $wso2iot_core::params::install_dir,
  $pack_dir               = $wso2iot_core::params::pack_dir,
  $pack_filename          = $wso2iot_core::params::pack_filename,
  $pack_extracted_dir     = $wso2iot_core::params::pack_extracted_dir,
  $patches_dir            = $wso2iot_core::params::patches_dir,
  $service_name           = $wso2iot_core::params::service_name,
  $service_template       = $wso2iot_core::params::service_template,
  $ipaddress              = $wso2iot_core::params::ipaddress,
  $enable_secure_vault    = $wso2iot_core::params::enable_secure_vault,
  $secure_vault_configs   = $wso2iot_core::params::secure_vault_configs,
  $key_stores             = $wso2iot_core::params::key_stores,
  $carbon_home            = $wso2iot_core::params::carbon_home,
  $pack_file_abs_path     = $wso2iot_core::params::pack_file_abs_path,

  # Templated configuration parameters
  $master_datasources     = $wso2iot_core::params::master_datasources,
  $registry_mounts        = $wso2iot_core::params::registry_mounts,
  $hostname               = $wso2iot_core::params::hostname,
  $mgt_hostname           = $wso2iot_core::params::mgt_hostname,
  $worker_node            = $wso2iot_core::params::worker_node,
  $usermgt_datasource     = $wso2iot_core::params::usermgt_datasource,
  $local_reg_datasource   = $wso2iot_core::params::local_reg_datasource,
  $clustering             = $wso2iot_core::params::clustering,
  $dep_sync               = $wso2iot_core::params::dep_sync,
  $ports                  = $wso2iot_core::params::ports,
  $jvm                    = $wso2iot_core::params::jvm,
  $fqdn                   = $wso2iot_core::params::fqdn,
  $sso_authentication     = $wso2iot_core::params::sso_authentication,
  $oauth_authentication   = $wso2iot_core::params::oauth_authentication,
  $user_management        = $wso2iot_core::params::user_management
) inherits wso2iot_core::params {

  validate_hash($iot_wsdl_epr_prefix)

  validate_hash($master_datasources)
  if $registry_mounts != undef {
    validate_hash($registry_mounts)
  }
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
  validate_hash($oauth_authentication)
  validate_hash($user_management)

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
