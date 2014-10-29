#
# Cookbook Name:: packages
# Recipe:: default
#
# Copyright 2013, Opscode, Inc.
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

Chef::Log.info "packages:#{node['packages'].inspect}"

case node['packages']
when Array

  node['packages'].each do |pkg|
    package pkg do
      action node['packages_default_action'].to_sym
    end
  end

when Hash

  node['packages'].each do |pkg, act|
    package pkg.to_s do
      action act.to_sym
    end
  end

end
