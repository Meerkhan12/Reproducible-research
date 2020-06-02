
{
  "target": "bmv2",
  "p4info": "build/aqm.p4info",
  "bmv2_json": "build/aqm.json",
  "table_entries": [
    {
      "table": "MyIngress.ipv4_lpm",
      "default_action": true,
      "action_name": "MyIngress.drop",
      "action_params": { }
    },
    {
      "table": "MyIngress.ipv4_lpm",
      "match": {
        "hdr.ipv4.dstAddr": ["10.187.16.193", 32]
      },
      "action_name": "MyIngress.ipv4_forward",
      "action_params": {
        "dstAddr": "00:18:71:72:1f:f6",
        "port": 2 
      }
    },
    {
      "table": "MyIngress.ipv4_lpm",
      "match": {
        "hdr.ipv4.dstAddr": ["10.187.255.211", 32]
      },
      "action_name": "MyIngress.ipv4_forward",
      "action_params": {
        "dstAddr": "dc:4a:3e:84:b6:80",
        "port": 1 
      }
    },
    {
      "table": "MyEgress.aqm",
      "match": {
        "standard_metadata.egress_port": [2]
      },
        "action_name": "MyEgress.pi2",
        "action_params": {
         "alpha": 1342,
         "beta": 13421, 
	 	 "target": 20000,
	     "interval": 15
      }
    }
  ]
}
