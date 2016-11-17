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
class wso2mb (
  # wso2mb specific configuration data
  $mb_thrift_server       = $wso2mb::params::mb_thrift_server,
  $mb_thrift_port         = $wso2mb::params::mb_thrift_port,
  $metrics_datasources    = $wso2mb::params::metrics_datasources,

  $packages               = $wso2mb::params::packages,
  $template_list          = $wso2mb::params::template_list,
  $file_list              = $wso2mb::params::file_list,
  $patch_list             = $wso2mb::params::patch_list,
  $cert_list              = $wso2mb::params::cert_list,
  $system_file_list       = $wso2mb::params::system_file_list,
  $directory_list         = $wso2mb::params::directory_list,
  $hosts_mapping          = $wso2mb::params::hosts_mapping,
  $java_home              = $wso2mb::params::java_home,
  $java_prefs_system_root = $wso2mb::params::java_prefs_system_root,
  $java_prefs_user_root   = $wso2mb::params::java_prefs_user_root,
  $vm_type                = $wso2mb::params::vm_type,
  $wso2_user              = $wso2mb::params::wso2_user,
  $wso2_group             = $wso2mb::params::wso2_group,
  $product_name           = $wso2mb::params::product_name,
  $product_version        = $wso2mb::params::product_version,
  $platform_version       = $wso2mb::params::platform_version,
  $carbon_home_symlink    = $wso2mb::params::carbon_home_symlink,
  $remote_file_url        = $wso2mb::params::remote_file_url,
  $maintenance_mode       = $wso2mb::params::maintenance_mode,
  $install_mode           = $wso2mb::params::install_mode,
  $install_dir            = $wso2mb::params::install_dir,
  $pack_dir               = $wso2mb::params::pack_dir,
  $pack_filename          = $wso2mb::params::pack_filename,
  $pack_extracted_dir     = $wso2mb::params::pack_extracted_dir,
  $patches_dir            = $wso2mb::params::patches_dir,
  $service_name           = $wso2mb::params::service_name,
  $service_template       = $wso2mb::params::service_template,
  $ipaddress              = $wso2mb::params::ipaddress,
  $enable_secure_vault    = $wso2mb::params::enable_secure_vault,
  $secure_vault_configs   = $wso2mb::params::secure_vault_configs,
  $key_stores             = $wso2mb::params::key_stores,
  $carbon_home            = $wso2mb::params::carbon_home,
  $pack_file_abs_path     = $wso2mb::params::pack_file_abs_path,

  # Templated configuration parameters
  $master_datasources     = $wso2mb::params::master_datasources,
  $registry_mounts        = $wso2mb::params::registry_mounts,
  $hostname               = $wso2mb::params::hostname,
  $mgt_hostname           = $wso2mb::params::mgt_hostname,
  $worker_node            = $wso2mb::params::worker_node,
  $usermgt_datasource     = $wso2mb::params::usermgt_datasource,
  $local_reg_datasource   = $wso2mb::params::local_reg_datasource,
  $clustering             = $wso2mb::params::clustering,
  $dep_sync               = $wso2mb::params::dep_sync,
  $ports                  = $wso2mb::params::ports,
  $jvm                    = $wso2mb::params::jvm,
  $fqdn                   = $wso2mb::params::fqdn,
  $sso_authentication     = $wso2mb::params::sso_authentication,
  $user_management        = $wso2mb::params::user_management
) inherits wso2mb::params {

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