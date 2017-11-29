## 3.1.6
  - Add docs for TCP protocol option, which has existed since 3.1.3

## 3.1.5
  - Update gemspec summary

## 3.1.4
  - Fix some documentation issues

## 3.1.3
  - Add support for output via TCP protocol

## 3.1.2
  - Remove call of logger with an array object which caused logstash to terminate

## 3.1.1
  - Relax constraint on logstash-core-plugin-api to >= 1.60 <= 2.99

## 3.1.0
 - breaking,config: Remove deprecated config `facility` and `file`, please add the necessary into `custom_fields` configuration so they are send as `_`-fields
 - breaking,config: Remove deprecated config `line`, please add it into `custom_fields` configuration so it is send as `_`-field. Please also ensure to convert it to integer upfront.

## 3.0.1
 - Republish all the gems under jruby.

## 3.0.0
 - Update the plugin to the version 2.0 of the plugin api, this change is required for Logstash 5.0 compatibility. See https://github.com/elastic/logstash/issues/5141

## 2.0.5
 - Depend on logstash-core-plugin-api instead of logstash-core, removing the need to mass update plugins on major releases of logstash

## 2.0.4
 - New dependency requirements for logstash-core for the 5.0 release

## 2.0.3
 - Fix crash when level is number

## 2.0.0
 - Plugins were updated to follow the new shutdown semantic, this mainly allows Logstash to instruct input plugins to terminate gracefully, 
   instead of using Thread.raise on the plugins' threads. Ref: https://github.com/elastic/logstash/pull/3895
 - Dependency on logstash-core update to 2.0

## 1.1.0
 - Add test to the project
