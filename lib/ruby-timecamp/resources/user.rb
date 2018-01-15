module TimeCamp
  class User < TimeCamp::Resource
    attr_reader :user_id, :email, :login_count, :display_name,
                :synch_time, :login_time, :group_id

    #################
    # CLASS METHODS #
    #################

    def self.get
      response = TimeCamp::Request.get(resource_name)
      return UserCollection.parse(response)
    end

    ####################
    # INSTANCE METHODS #
    ####################

    private

    def load_attributes(response)
      @user_id = response[:user_id]
      @email = response[:email]
      @login_count = response[:login_count]
      @display_name = response[:display_name]
      @synch_time = response[:synch_time]
      @login_time = response[:login_time]
      @group_id = response[:group_id]
    end
  end
end