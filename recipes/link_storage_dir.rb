#
# Cookbook Name:: graphite
# Recipe:: web
#
# Copyright 2011, Heavy Water Software Inc.
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

unless node['graphite']['linked_storage_dir'].empty?

  directory node['graphite']['base_dir'] do
    recursive true
  end

  directory node['graphite']['linked_storage_dir'] do
    owner node['apache']['user']
    group node['apache']['group']
    recursive true
  end

  link "#{node['graphite']['base_dir']}/storage" do
    owner node['apache']['user']
    group node['apache']['group']
    to node['graphite']['linked_storage_dir']
  end
end
