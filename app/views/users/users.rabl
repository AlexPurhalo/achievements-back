object false
node(:meta) { |m| {
                total_pages: User.all.count % 10 === 0 ? User.all.count / 10 : User.all.count / 10 + 1,
                total_objects: User.all.count
            }}
child(@users, :root => false, :object_root => false) { attribute :id, :username }

