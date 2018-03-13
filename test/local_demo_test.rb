require_relative "../models/profile"
#require "pry"

raw_cert = `pkcs15-tool --read-certificate 2`

cert = OpenSSL::X509::Certificate.new(raw_cert)

profile = Profile.new(cert)

puts "SERIAL NUMBER: #{profile.serial_number}"
puts "VALIDITY: #{profile.issue_at.strftime("%Y-%m-%d")} to #{profile.expire_at.strftime("%Y-%m-%d")}"
puts "ISSUER: #{profile.issuer.org} (#{profile.issuer.org_unit})"
puts "CRL: #{profile.crl_url}"
puts "SUBJECT ORG: #{profile.subject.org}"
puts "SUBJECT ORG UNIT: #{profile.subject.org_unit}"
puts "SUBJECT NAME: #{profile.subject.common_name}"
puts "SUBJECT UID: #{profile.subject.uid}"
puts "SUBJECT EMAIL: #{profile.subject_email_address}"
