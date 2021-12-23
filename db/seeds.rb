# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Job.delete_all


admin = User.new(email: "nix@joblite.com", password: "password", password_confirmation: "password", admin: true, job_seeker: true, employer: true)
admin.skip_confirmation!
admin.save

job_seeker = User.new(email: "job_seeker@joblite.com", password: "password", password_confirmation: "password", admin: false, job_seeker: true, employer: false)
job_seeker.skip_confirmation!
job_seeker.save

employer = User.new(email: "employer@joblite.com", password: "password", password_confirmation: "password", admin: false, job_seeker: false, employer: true)
employer.skip_confirmation!
employer.save

Job.create!(                  
    company_name: "Google",      
    company_website: "https://google.com",
    compensation_range: "90,000 - 100,000",
    compensation_type: "Full-time",
    estimated_hours: nil,  
    featured: true,                  
    featured_until: nil,  
    headquarters: "California" ,          
    link_to_apply: "https://google.com/apply",      
    price: 199,
    published_at: DateTime.now,          
    remote: false,                     
    slug: "google-developer",               
    status: "published",              
    title: "Google Developer",          
    upsell_type: nil,
    years_of_experience: "5",               
    user_id: admin.id,
    description: Faker::Hipster.paragraph,
    company_description: Faker::Hipster.paragraph 
)

Job.create!(                 
    company_name: "Dropbox",      
    company_website: "https://dropbox.com",
    compensation_range: nil,
    compensation_type: "Contract",
    estimated_hours: "more than 100",  
    featured: true,                  
    featured_until: 1.week.from_now.beginning_of_day,  
    headquarters: "California" ,          
    link_to_apply: "https://dropbox.com/apply",      
    price: 299,
    published_at: DateTime.now,          
    remote: true,                     
    slug: "ruby-developer",               
    status: "published",              
    title: "Ruby Developer",              
    upsell_type: "best",
    years_of_experience: "5",               
    user_id: job_seeker.id,
    description: Faker::Hipster.paragraph,
    company_description: Faker::Hipster.paragraph    
)

Job.create!(                
    company_name: "Apple",      
    company_website: "https://apple.com",
    compensation_range: "greater than 200,000",
    compensation_type: "Contract",
    estimated_hours: "more than 100",  
    featured: true,                  
    featured_until: nil,  
    headquarters: "California" ,          
    link_to_apply: "https://apple.com/apply",      
    price: 199,
    published_at: DateTime.now,          
    remote: false,                     
    slug: "apply-employer",               
    status: "published",              
    title: "Apple Employer",              
    upsell_type: "best",
    years_of_experience: "8",               
    user_id: employer.id,
    description: Faker::Hipster.paragraph,
    company_description: Faker::Hipster.paragraph    
)