require 'openssl'
require 'active_support/core_ext/string'
require 'active_support/core_ext/object/try'

# TODO: refactor these models to inherit from OpenSSL::X509 classes when possible

class Profile
  attr_reader :cert

  # @param cert [OpenSSL::X509::Certificate]
  def initialize(cert)
    @cert = cert
  end

  def subject
    @subject ||= Subject.new(cert.subject)
  end

  def issuer
    @issuer ||= Issuer.new(cert.issuer)
  end

  def serial_number
    cert.serial.to_s
  end

  def issue_at
    cert.not_before
  end

  def expire_at
    cert.not_after
  end

  def lines
    @lines || cert.to_text.split("\n")
  end

  def subject_email_address
    begin
      line = lines.find{|str| str.include?("email:")}
      return line.strip.split("email:").last
    rescue => e
      return "OOPS"
    end
  end

  def crl_url
    begin
      line = lines.find{|str| str.include?(".crl")}
      return line.strip.split("URI:").last
    rescue => e
      return "OOPS"
    end
  end
end


class X509Name
  attr_reader :raw

  # @param raw [OpenSSL::X509::Name]
  def initialize(raw)
    @raw = raw
  end

  def arr
    @arr ||= raw.to_a
  end

  def country
    arr.find{|k,v| k=="C"}[1]
  end

  def org
    arr.find{|k,v| k=="O"}.try(:[], 1) || "OOPS"
  end
end

class Subject < X509Name
  def common_name
    arr.find{|k,v| k=="CN"}[1].try(:titlecase)
  end

  def uid
    arr.find{|k,v| k=="UID"}[1]
  end

  def org_unit
    arr.find{|k,v| k=="OU"}[1]
  end
end

class Issuer < X509Name
  def org_unit
    begin
      return arr.select{|k,v| k=="OU"}.map{|arr| arr[1] }.join(", ")
    rescue => e
      return "OOPS"
    end
  end
end
