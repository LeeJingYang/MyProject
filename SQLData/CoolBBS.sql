use master
go
create database CoolBBS 
on  primary
(
    name='CoolBBS', 
    filename='E:\Mine\.Net Web\CoolBBS\CoolBBS\SQLData\CoolBBS.mdf', 
    size=5mb,
    maxsize=10000mb,
    filegrowth=15%
)
log on
(
    name='stuDB_log',
    filename='E:\Mine\.Net Web\CoolBBS\CoolBBS\SQLData\CoolBBS_log.ldf',
    size=2mb,
    filegrowth=1mb
)
go
select * from Picture
use CoolBBS	
go
create table [User]--�û���
(
	UserNum	nvarchar(50) primary key,													--���	guid
	UserName nvarchar(100)not null unique,												--����	�ǿ�	
	[Password] nvarchar(150) not null,													--����	 
	Gender char(5) check(Gender='��'or Gender='Ů' or Gender='����'),					--�Ա�	�ǿ�
	Email nvarchar(50) not null unique,													--����
	Birthday date,																		--����
	QQNumber nvarchar(15),																--QQ����
	Hobby nvarchar(1000),																--��Ȥ����
	LoginInfo nvarchar(200),															--��¼��Ϣ
	LastLoginTime date,																	--����¼ʱ��
	Remark	nvarchar(1000),																--���ҽ���		
	RegTime	datetime default(getdate()) not null,										--ע������	ע�ᵱ�� �ǿ�
	UserRole int not null,																--�û���ɫ  0:����Ա 1:�û� 
	[State]	int check([State]=0 or [State]=1)not null,									--״̬		0:����	1:����
)
go
create table [SectionType]--������ͱ�
(
	SectionTypeID nvarchar(50) primary key,												--������ͱ��
	SectionTypeName nvarchar(100) not null unique,										--�����������
	[State] int check([State]=0 or [State]=1),											--״̬
)
go
create table [Section]--���
(
		SectionID nvarchar(50) primary key,													--���ͱ��
		SectionName nvarchar(100)not null unique,											--������
		SectionTypeID nvarchar(50) foreign key references [SectionType](SectionTypeID),		--�����  ������������
		[State] int check([State]=0 or [State]=1),											--״̬
)
go
create table [Dynamic]--���ӱ�
(
	DynamicID nvarchar(50) primary key ,												--���ӱ��  guid
	DynamicTitle nvarchar(1000),														--����
	DynamicContent nvarchar(4000)not null,												--����
	SectionID nvarchar(50) foreign key references [Section](SectionID),					--�����  �����������ͱ����ͱ��
	PublishDate datetime default(getdate()) not null,									--��������	Ĭ�ϵ���������								
	UserNum nvarchar(50) foreign key references [User](UserNum),						--�û����
	ReadCount int,																		--���鿴����
	[State] int check([State]=0 or [State]=1)											--״̬
)
go
create table Reply-- �ظ���
(
	ReplyID nvarchar(50) primary key ,													--�ظ����  guid
	ReplyContent nvarchar(2000)not null,												--�ظ����� 
	PublishDate datetime default(getdate()) not null,									--�ظ�����	
	DynamicID nvarchar(50) foreign key references [Dynamic](DynamicID),					--���ӱ��
	UserNum nvarchar(50)foreign key references [User](UserNum),							--�û����
	[State] int check([State]=0 or [State]=1)											--״̬
)
go
create table Picture--ͼƬ��							
(
	PictureID int primary key identity(1,1),											--ͼƬ���
	PicturesPath nvarchar(500) not null,												--ͼƬ
	PictureNum nvarchar(50),															--ͼƬ����
	[State] int check([State]=0 or [State]=1)											--״̬
)
go
create table Follow--��ע��
(
	FollowID int primary key identity(1,1),												--��ע����
	FollowUserNum nvarchar(50) foreign key references [User](UserNum),					--��ע�߱��
	BeUserNum nvarchar(50) foreign key references [User](UserNum),						--����ע�߱��
	[State] int check([State]=0 or [State]=1)											--״̬
)
go
create table [Collection]--�ղر�
(
	CollectionID int primary key identity(1,1),
	UserNum nvarchar(50) foreign key references [User](UserNum),						--�û����  guid
	DynamicID nvarchar(50) foreign key references [Dynamic](DynamicID),					--���ӱ��
	[State] int check([State]=0 or [State]=1)											--״̬
)
go

select * from [Dynamic] order by ReadCount desc   --��ѯ���� �����Ķ�������
go

select top(10) d.SectionID
from [Dynamic] d group by d.SectionID order by count(d.SectionID) --��ѯ����������ǰ10�Ļ���id
go	

select * from [User] where UserNum in(select BeUserNum from [Follow] where FollowUserNum='userxxxxxx')  --��ѯ�û��Ĺ�ע��
go

create proc proc_collectListByUserNum @UserNum nvarchar(50)
as
	select d.* from [Collection] c join [Dynamic] d 
		on c.DynamicID=d.DynamicID where c.UserNum=@UserNum
go

create trigger tri_insertUser     --������:�û���ӳɹ������Ĭ��ͷ��ͼƬ
on [User]
for insert
as 
	declare @UserNum nvarchar(50)
	select @UserNum=[UserNum] from inserted
	insert into Picture values('Image/user.jpg',@UserNum,0)
go

create nonclustered index index_DynamicTitle --����һ���Ǿۼ�����
on [Dynamic](DynamicTitle) --ΪTEST���TNAME�ֶδ�������
go


insert into [User]([UserNum],[UserName],[Password],[Email],[RegTime],[UserRole],[State]) 
values('user131612711130116355','GG','D1-B7-8E-81-C5-AD-C3-86-F6-8D-BC-5A-42-B2-FD-CB','774891951@qq.com','2018/1/24 20:38:33','0','0')

go
insert into [SectionType] values('sType201801250001','�ᰲ��ɫ',0)
go
insert into [Section] values('section201801250001','���ڿᰲ�Ĺ���','sType201801250001',0)
insert into [Section] values('section201801250002','Ůװ����','sType201801250001',0)
insert into [Section] values('section201801250003','�ᰲ����','sType201801250001',0)
insert into [Section] values('section201801250004','�ᰲ���ջ�','sType201801250001',0)
insert into [Section] values('section201801250005','�ᰲ��','sType201801250001',0)
go
insert into [SectionType] values('sType201801250002','����',0)
go
insert into [Section] values('section201801250006','���ֽ���','sType201801250002',0)
insert into [Section] values('section201801250007','�ᰲ��ó��','sType201801250002',0)
insert into [Section] values('section201801250008','������','sType201801250002',0)
insert into [Section] values('section201801250009','թƭͨ����','sType201801250002',0)
insert into [Section] values('section2018012500010','�˿ӻ�Ѫ���˳�!','sType201801250002',0)
go
insert into [SectionType] values('sType201801250003','����',0)
go
insert into [Section] values('section2018012500011','����־','sType201801250003',0)
insert into [Section] values('section2018012500012','�����ʲô','sType201801250003',0)
insert into [Section] values('section2018012500013','���ѻ�','sType201801250003',0)
insert into [Section] values('section2018012500014','�ֻ���Ӱ','sType201801250003',0)
insert into [Section] values('section2018012500015','��Ȥ����!','sType201801250003',0)
insert into [Section] values('section2018012500016','������!','sType201801250003',0)
go
insert into [SectionType] values('sType201801250004','���',0)
go
insert into [Section] values('section2018012500017','�ᰲҹ��','sType201801250004',0)
insert into [Section] values('section2018012500018','�������С��','sType201801250004',0)
insert into [Section] values('section2018012500019','��ض���ָ��','sType201801250004',0)
insert into [Section] values('section2018012500020','�����ӻ���','sType201801250004',0)
go
insert into [SectionType] values('sType201801250005','Ӱ��',0)
go
insert into [Section] values('section2018012500021','������','sType201801250005',0)
insert into [Section] values('section2018012500022','�õ�Ӱ','sType201801250005',0)
insert into [Section] values('section2018012500023','bilibiliֵ�÷���������Ƶ','sType201801250005',0)
insert into [Section] values('section2018012500024','��������Щ������','sType201801250005',0)
insert into [Section] values('section2018012500025','��¼Ƭ','sType201801250005',0)
insert into [Section] values('section2018012500026','��׷��','sType201801250005',0)
go
insert into [SectionType] values('sType201801250006','����Ԫ',0)
go
insert into [Section] values('section2018012500027','����δ��','sType201801250006',0)
insert into [Section] values('section2018012500028','Pվ��ʦ�Ƽ�','sType201801250006',0)
insert into [Section] values('section2018012500029','GalGame','sType201801250006',0)
insert into [Section] values('section2018012500030','Cosplay','sType201801250006',0)
insert into [Section] values('section2018012500031','������','sType201801250006',0)
go
insert into [SectionType] values('sType201801250007','��Ϸ',0)
go
insert into [Section] values('section2018012500032','������ҫΪ����ôdiao','sType201801250007',0)
insert into [Section] values('section2018012500033','Steam','sType201801250007',0)
insert into [Section] values('section2018012500034','�ᰲ�����Ϸ��ѡ','sType201801250007',0)
insert into [Section] values('section2018012500035','�ҵ�����','sType201801250007',0)
insert into [Section] values('section2018012500036','������Ϸ','sType201801250007',0)
insert into [Section] values('section2018012500037','����������Ϸ','sType201801250007',0)
go
insert into [SectionType] values('sType201801250008','����',0)
go
insert into [Section] values('section2018012500038','������ǧ�������Ķ���','sType201801250008',0)
insert into [Section] values('section2018012500039','ID������','sType201801250008',0)
insert into [Section] values('section2018012500040','���볷�ص�һ�β���','sType201801250008',0)
insert into [Section] values('section2018012500041','˵���㱻�ӵľ���','sType201801250008',0)
insert into [Section] values('section2018012500042','�ᰲ����ô���ӵ��û���','sType201801250008',0)
go

insert into Dynamic	values('dynamic201801250001','just a title','content','section2018012500042',GETDATE(),'user131612711130116355',10,0)

insert into Dynamic values('dynamic201801250002','just a title two','content','section2018012500038',GETDATE(),'user131612711130116355',10,0)

insert into Dynamic values('dynamic201801250003','just a title three','content','section2018012500039',GETDATE(),'user131612711130116355',10,0)

delete  from Reply
select * from [Dynamic]
select * from [SectionType] where [State]=0
select ROW_NUMBER() over(order by [DynamicID]) as RowID,* from[Dynamic]

update [Picture] set [PictureID]='5',[PicturesPath]='Image/UserPic/131617655574383403.jpg',[PictureNum]='user131615817717981668',[State]='0' where [PictureID]='5'

select * from [Follow]
select * from [Collection]
select * from [Picture]

select * from [User] where [State]=0 and [UserNum] in(select [UserNum] from [Dynamic] where [DynamicID]='dynamic131615808140298346')