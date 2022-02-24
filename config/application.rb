
require 'moesif_rack'
require 'rack'

module MoesifOptions
    @moesif_options = {
    'application_id' =>  'Your Moesif Application Id',
    'debug' => true,
    'capture_outoing_requests' => false,
    'log_body' => true,
    'log_body_outgoing' => true
    }
    
    @moesif_options['identify_user'] = Proc.new{|env, headers, body|
        'my_user_id'
    }
    
    @moesif_options['identify_company'] = Proc.new{|env, headers, body|
        'my_company_id'
    }
    
    @moesif_options['identify_session'] = Proc.new{|env, headers, body|
        'session1'
    }
    
    @moesif_options['get_metadata'] = Proc.new{|env, headers, body|
        {
        'foo' => '123'
        }
    }

    @moesif_options['skip'] = Proc.new{|env, headers, body|
        # Add your custom code that returns true to skip logging the API call
        if env.key?("REQUEST_URI")
            # Skip probes to health page
            env["REQUEST_URI"].include? "/health"
        else
            false
        end
    }
    
    @moesif_options['get_metadata_outgoing'] = Proc.new{|request, response|
        {
        'capture_outgoing' => 'true'
        }
    }
    
    @moesif_options['identify_user_outgoing'] = Proc.new{|request, response|
        'outgoing_user_id'
    }
    
    @moesif_options['identify_company_outgoing'] = Proc.new{|request, response|
        'outgoing_company_id'
    }
    
    @moesif_options['identify_session_outgoing'] = Proc.new{|request, response|
        'outgoing_session_token'
    }
    
    @moesif_options['skip_outgoing'] = Proc.new{|request, response|
        false
    }
    
    @moesif_options['mask_data_outgoing'] = Proc.new{|event_model|
        event_model
    }

    def self.moesif_options
        return @moesif_options
    end
end


