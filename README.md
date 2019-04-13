* Installation

Set up the database, seed with data:
```
bundle install
rake db:create
rake db:migrate
rake db:seed
```

* Operation

Run the server via `rails s`, which will start it listening on localhost:3000

API:
* Listing all parts:
`GET http://localhost:3000/api/v1/parts`

* Listing all orphaned parts (those not belonging to any assembly):
`GET http://localhost:3000/api/v1/parts/orphaned`

* Listing all parts in use (those belonging to at least one assembly):
`GET http://localhost:3000/api/v1/parts/in_use`

* Listing a specific part:
`GET http://localhost:3000/api/v1/parts/1`

A typical response to this might be:
```
{
	"data": {
		"id": "3",
		"type": "part",
		"attributes": {
			"name": "Barrel Top",
			"part_id": "BT",
			"dependent_assemblies": [{
				"id": 2,
				"name": "Barrel Top With Clip",
				"variant": null,
				"needs_maintenance": false,
				"created_at": "2019-04-12T18:42:48.245Z",
				"updated_at": "2019-04-12T18:42:48.245Z"
			}, {
				"id": 7,
				"name": "Inkless, Bottomless Pen",
				"variant": null,
				"needs_maintenance": false,
				"created_at": "2019-04-12T18:42:48.345Z",
				"updated_at": "2019-04-12T18:42:48.345Z"
			}, {
				"id": 9,
				"name": "Inkless Pen (Metal)",
				"variant": null,
				"needs_maintenance": true,
				"created_at": "2019-04-12T18:42:48.381Z",
				"updated_at": "2019-04-12T19:03:04.667Z"
			}, {
				"id": 8,
				"name": "Inkless Pen (Plastic)",
				"variant": null,
				"needs_maintenance": true,
				"created_at": "2019-04-12T18:42:48.364Z",
				"updated_at": "2019-04-12T19:05:29.238Z"
			},
      ...]
		},
		"relationships": {
			"assemblies": {
				"data": [{
					"id": "2",
					"type": "assembly"
				}]
			}
		}
	}
}
```

You can see the part name, part id, all assemblies that depend on this part (directly or indirectly), and any assemblies this part directly belongs to (in `relationships`).

* Deleting a specific part:
`DELETE http://localhost:3000/api/v1/parts/1`
This will also remove it from any assemblies it was a member of and mark those assemblies as needing maintenance

* Creating a new part:
`POST /api/v1/parts?part[part_id]=NIB&part[name]=Tungsten%20nib`

* Creating an assembly from two parts (*returns an Assembly object*):
`POST /api/v1/parts/create_assembly?first_part_id=4&second_part_id=3`

* Listing a specific assembly, including its component parts, subassemblies and whether it needs maintenance:
`GET http://localhost:3000/api/v1/assemblies/1`

* Deleting a part from an assembly:
`DELETE http://localhost:3000/api/v1/assemblies/23?part_id=3`

* Listing all subassemblies:
`GET http://localhost:3000/api/v1/assemblies/subassemblies`

* Listing all top-level assemblies:
`GET http://localhost:3000/api/v1/assemblies/top_level`

* Monitoring

Sidekiq is installed and should be mostly configured, but is not enabled by default. If you wish to enable it, provision a redis server for it to use, uncomment the sidekiq sections from the Gemfile, routes.rb and config/initializers/sidekiq.rb and run `bundle install`. It has a daily cron job that runs at 16:45 each day and emails you a list which Assemblies had Parts deleted from them and are in need of maintenance.
