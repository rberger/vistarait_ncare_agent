#
# Cookbook Name:: vistarait_ncare_agent
# Recipe:: default
#
# Copyright (C) 2013 Robert J. Berger
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "apt"

platform = node['platform']

# For now only supporting ubuntu since we don't have any centos to test on
Chef::Log.fatal!("Only works on Ubuntu. Instance is: #{platform}") unless platform?("ubuntu")

ncare_agent = node['ncare_agent']
pkg_name = "ncare_agent"
pkg_name_base = ncare_agent['pkg_name_base']
pkg_filename = "#{pkg_name_base}_all.deb"
pkg_url = ncare_agent[platform]['url']
pkg_checksum = ncare_agent[platform]['checksum']
pkg_destination = "#{Chef::Config['file_cache_path']}/#{pkg_filename}"
conf_file_name = ncare_agent['conf_filename']
conf_file_path = "#{ncare_agent['conf_dir']}/#{conf_file_name}"

ncare_agent[platform]['packages'].each do |pkg|
  package pkg
end

template conf_file_path do
  source "#{conf_file_name}.erb"
  variables(
            :auth_token = ncare_agent['auth_token']
           )
end

package pkg_name  do
  action :nothing
  source pkg_destination
#  version ncare_agent['version']
  provider Chef::Provider::Package::Dpkg
end

remote_file pkg_destination do
  source pkg_url
  checksum pkg_checksum
  owner 'root'
  group 'root'
  mode '0644'
  notifies :install, "package[#{pkg_name}]", :immediately
end


service "ncare-agent" do
  supports :status => true, :restart => true
  action [ :enable, :start ]
end
