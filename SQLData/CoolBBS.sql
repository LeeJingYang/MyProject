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
create table [User]--用户表
(
	UserNum	nvarchar(50) primary key,													--编号	guid
	UserName nvarchar(100)not null unique,												--姓名	非空	
	[Password] nvarchar(150) not null,													--密码	 
	Gender char(5) check(Gender='男'or Gender='女' or Gender='保密'),					--性别	非空
	Email nvarchar(50) not null unique,													--邮箱
	Birthday date,																		--生日
	QQNumber nvarchar(15),																--QQ号码
	Hobby nvarchar(1000),																--兴趣爱好
	LoginInfo nvarchar(200),															--登录信息
	LastLoginTime date,																	--最后登录时间
	Remark	nvarchar(1000),																--自我介绍		
	RegTime	datetime default(getdate()) not null,										--注册日期	注册当天 非空
	UserRole int not null,																--用户角色  0:管理员 1:用户 
	[State]	int check([State]=0 or [State]=1)not null,									--状态		0:可用	1:禁用
)
go
create table [SectionType]--版块类型表
(
	SectionTypeID nvarchar(50) primary key,												--版块类型编号
	SectionTypeName nvarchar(100) not null unique,										--版块类型名称
	[State] int check([State]=0 or [State]=1),											--状态
)
go
create table [Section]--版块
(
		SectionID nvarchar(50) primary key,													--类型编号
		SectionName nvarchar(100)not null unique,											--类型名
		SectionTypeID nvarchar(50) foreign key references [SectionType](SectionTypeID),		--版块编号  关联版块表版块编号
		[State] int check([State]=0 or [State]=1),											--状态
)
go
create table [Dynamic]--帖子表
(
	DynamicID nvarchar(50) primary key ,												--帖子编号  guid
	DynamicTitle nvarchar(1000),														--标题
	DynamicContent nvarchar(4000)not null,												--内容
	SectionID nvarchar(50) foreign key references [Section](SectionID),					--版块编号  关联帖子类型表类型编号
	PublishDate datetime default(getdate()) not null,									--发表日期	默认当天年月日								
	UserNum nvarchar(50) foreign key references [User](UserNum),						--用户编号
	ReadCount int,																		--被查看次数
	[State] int check([State]=0 or [State]=1)											--状态
)
go
create table Reply-- 回复表
(
	ReplyID nvarchar(50) primary key ,													--回复编号  guid
	ReplyContent nvarchar(2000)not null,												--回复内容 
	PublishDate datetime default(getdate()) not null,									--回复日期	
	DynamicID nvarchar(50) foreign key references [Dynamic](DynamicID),					--帖子编号
	UserNum nvarchar(50)foreign key references [User](UserNum),							--用户编号
	[State] int check([State]=0 or [State]=1)											--状态
)
go
create table Picture--图片表							
(
	PictureID int primary key identity(1,1),											--图片编号
	PicturesPath nvarchar(500) not null,												--图片
	PictureNum nvarchar(50),															--图片组编号
	[State] int check([State]=0 or [State]=1)											--状态
)
go
create table Follow--关注表
(
	FollowID int primary key identity(1,1),												--关注表编号
	FollowUserNum nvarchar(50) foreign key references [User](UserNum),					--关注者编号
	BeUserNum nvarchar(50) foreign key references [User](UserNum),						--被关注者编号
	[State] int check([State]=0 or [State]=1)											--状态
)
go
create table [Collection]--收藏表
(
	CollectionID int primary key identity(1,1),
	UserNum nvarchar(50) foreign key references [User](UserNum),						--用户编号  guid
	DynamicID nvarchar(50) foreign key references [Dynamic](DynamicID),					--帖子编号
	[State] int check([State]=0 or [State]=1)											--状态
)
go

select * from [Dynamic] order by ReadCount desc   --查询帖子 根据阅读数降序
go

select top(10) d.SectionID
from [Dynamic] d group by d.SectionID order by count(d.SectionID) --查询帖子数降序前10的话题id
go	

select * from [User] where UserNum in(select BeUserNum from [Follow] where FollowUserNum='userxxxxxx')  --查询用户的关注者
go

create proc proc_collectListByUserNum @UserNum nvarchar(50)
as
	select d.* from [Collection] c join [Dynamic] d 
		on c.DynamicID=d.DynamicID where c.UserNum=@UserNum
go

create trigger tri_insertUser     --触发器:用户添加成功后添加默认头像图片
on [User]
for insert
as 
	declare @UserNum nvarchar(50)
	select @UserNum=[UserNum] from inserted
	insert into Picture values('Image/user.jpg',@UserNum,0)
go

create nonclustered index index_DynamicTitle --创建一个非聚集索引
on [Dynamic](DynamicTitle) --为TEST表的TNAME字段创建索引
go


insert into [User]([UserNum],[UserName],[Password],[Email],[RegTime],[UserRole],[State]) 
values('user131612711130116355','GG','D1-B7-8E-81-C5-AD-C3-86-F6-8D-BC-5A-42-B2-FD-CB','774891951@qq.com','2018/1/24 20:38:33','0','0')

go
insert into [SectionType] values('sType201801250001','酷安特色',0)
go
insert into [Section] values('section201801250001','我在酷安的故事','sType201801250001',0)
insert into [Section] values('section201801250002','女装大佬','sType201801250001',0)
insert into [Section] values('section201801250003','酷安萌妹','sType201801250001',0)
insert into [Section] values('section201801250004','酷安生日会','sType201801250001',0)
insert into [Section] values('section201801250005','酷安鬼话','sType201801250001',0)
go
insert into [SectionType] values('sType201801250002','交易',0)
go
insert into [Section] values('section201801250006','二手交易','sType201801250002',0)
insert into [Section] values('section201801250007','酷安自贸区','sType201801250002',0)
insert into [Section] values('section201801250008','好卖家','sType201801250002',0)
insert into [Section] values('section201801250009','诈骗通缉榜','sType201801250002',0)
insert into [Section] values('section2018012500010','退坑回血便宜出!','sType201801250002',0)
go
insert into [SectionType] values('sType201801250003','生活',0)
go
insert into [Section] values('section2018012500011','旅行志','sType201801250003',0)
insert into [Section] values('section2018012500012','今天吃什么','sType201801250003',0)
insert into [Section] values('section2018012500013','字友会','sType201801250003',0)
insert into [Section] values('section2018012500014','手机摄影','sType201801250003',0)
insert into [Section] values('section2018012500015','奇趣玩物!','sType201801250003',0)
insert into [Section] values('section2018012500016','告别书荒!','sType201801250003',0)
go
insert into [SectionType] values('sType201801250004','情感',0)
go
insert into [Section] values('section2018012500017','酷安夜话','sType201801250004',0)
insert into [Section] values('section2018012500018','初恋这件小事','sType201801250004',0)
insert into [Section] values('section2018012500019','异地独居指南','sType201801250004',0)
insert into [Section] values('section2018012500020','解忧杂货店','sType201801250004',0)
go
insert into [SectionType] values('sType201801250005','影音',0)
go
insert into [Section] values('section2018012500021','好音乐','sType201801250005',0)
insert into [Section] values('section2018012500022','好电影','sType201801250005',0)
insert into [Section] values('section2018012500023','bilibili值得反复看的视频','sType201801250005',0)
insert into [Section] values('section2018012500024','网易云那些神评论','sType201801250005',0)
insert into [Section] values('section2018012500025','纪录片','sType201801250005',0)
insert into [Section] values('section2018012500026','爱追剧','sType201801250005',0)
go
insert into [SectionType] values('sType201801250006','二次元',0)
go
insert into [Section] values('section2018012500027','初音未来','sType201801250006',0)
insert into [Section] values('section2018012500028','P站画师推荐','sType201801250006',0)
insert into [Section] values('section2018012500029','GalGame','sType201801250006',0)
insert into [Section] values('section2018012500030','Cosplay','sType201801250006',0)
insert into [Section] values('section2018012500031','海贼王','sType201801250006',0)
go
insert into [SectionType] values('sType201801250007','游戏',0)
go
insert into [Section] values('section2018012500032','王者荣耀为何这么diao','sType201801250007',0)
insert into [Section] values('section2018012500033','Steam','sType201801250007',0)
insert into [Section] values('section2018012500034','酷安年度游戏评选','sType201801250007',0)
insert into [Section] values('section2018012500035','我的世界','sType201801250007',0)
insert into [Section] values('section2018012500036','网易游戏','sType201801250007',0)
insert into [Section] values('section2018012500037','最近在玩的游戏','sType201801250007',0)
go
insert into [SectionType] values('sType201801250008','互动',0)
go
insert into [Section] values('section2018012500038','年轻人千万不能碰的东西','sType201801250008',0)
insert into [Section] values('section2018012500039','ID的由来','sType201801250008',0)
insert into [Section] values('section2018012500040','最想撤回的一次操作','sType201801250008',0)
insert into [Section] values('section2018012500041','说出你被坑的经历','sType201801250008',0)
insert into [Section] values('section2018012500042','酷安里特么被坑的用户名','sType201801250008',0)
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