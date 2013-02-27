#
# Cookbook Name:: vistarait_ncare_agent
# Attributes: default
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
default['ncare_agent']['version'] = '1.1.0-6'
default['ncare_agent']['auth_token'] = 'wtmWWcbnac9jnNXQ2mXbuZFgZbV5Napr'
default['ncare_agent']['server'] = 'ncare.netenrich.net'
default['ncare_agent']['pkg_name_base'] = "ncare-agent_#{default['ncare_agent']['version']}"
default['ncare_agent']['ubuntu']['url'] = "http://dl.dropbox.com/u/8561338/#{default['ncare_agent']['pkg_name_base']}_all.deb"
default['ncare_agent']['ubuntu']['checksum'] = ''
default['ncare_agent']['centos5']['url'] = "http://dl.dropbox.com/u/8561338/#{default['ncare_agent']['pkg_name_base']}.el5.noarch.rpm"
default['ncare_agent']['centos5']['checksum'] = ''
default['ncare_agent']['centos6']['url'] = "http://dl.dropbox.com/u/8561338/#{default['ncare_agent']['pkg_name_base']}.el6.noarch.rpm"
default['ncare_agent']['centos6']['checksum'] = ''
default['ncare_agent']['ubuntu']['packages'] = %w(python-twisted-web python-apt libsnmp15)
default['ncare_agent']['conf_dir'] = '/opt/ncare/conf'
default['ncare_agent']['conf_filename'] = 'config.properties'

