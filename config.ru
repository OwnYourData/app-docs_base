# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
use Rack::ReverseProxy do
  reverse_proxy(/^\/datavault(\/.*)$/, 'https://datavault-doc.ownyourdata.eu$1', opts = {:preserve_host => true})
  reverse_proxy(/^\/notary(\/.*)$/, 'https://blockchain-doc.ownyourdata.eu$1', opts = {:preserve_host => true})
  reverse_proxy(/^\/notary-sovrin(\/.*)$/, 'https://sovrin-doc.ownyourdata.eu$1', opts = {:preserve_host => true})
  reverse_proxy(/^\/semcon(\/.*)$/, 'https://semcon-doc.ownyourdata.eu$1', opts = {:preserve_host => true})
  reverse_proxy(/^\/semcon-billing(\/.*)$/, 'https://billing-doc.ownyourdata.eu$1', opts = {:preserve_host => true})
  reverse_proxy(/^\/semcon-validation(\/.*)$/, 'https://validation-doc.ownyourdata.eu$1', opts = {:preserve_host => true})
end
use Rack::Deflater

run Rails.application
