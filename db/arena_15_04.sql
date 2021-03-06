USE [arena_15_04]
GO
/****** Object:  Table [dbo].[bank_accounts]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bank_accounts](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[bank_branch_id] [int] NOT NULL,
	[account_number] [varchar](50) NULL,
	[is_active] [int] NOT NULL,
 CONSTRAINT [bank_accounts_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bank_branches]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bank_branches](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[bank_id] [int] NOT NULL,
	[address] [varchar](250) NOT NULL,
	[territory_id] [int] NULL,
	[updated_at] [datetime] NOT NULL,
 CONSTRAINT [bank_branches_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[banks]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[banks](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[address] [varchar](250) NOT NULL,
 CONSTRAINT [banks_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bonus_card_types]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bonus_card_types](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_bonus_card_types] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bonus_cards]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bonus_cards](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[fiscal_year_id] [int] NULL,
	[bonus_card_type_id] [tinyint] NULL,
	[product_id] [int] NULL,
	[min_qty_per_memo] [decimal](13, 2) NULL,
	[min_qty_per_year] [decimal](13, 2) NULL,
	[is_active] [tinyint] NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NULL,
 CONSTRAINT [PK_bonus_cards] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bonus_targets]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bonus_targets](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bonus_id] [int] NOT NULL,
	[type] [tinyint] NULL,
	[office_id] [int] NOT NULL,
	[territory_id] [int] NULL,
	[target_quantity] [decimal](18, 2) NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NULL,
 CONSTRAINT [PK_bonus_targets] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[bonuses]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bonuses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mother_product_id] [int] NOT NULL,
	[mother_product_quantity] [decimal](18, 2) NOT NULL,
	[bonus_product_id] [int] NOT NULL,
	[bonus_product_quantity] [decimal](18, 2) NOT NULL,
	[effective_date] [date] NOT NULL,
	[end_date] [date] NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[updated_by] [int] NULL,
 CONSTRAINT [bonuses_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[brands]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[brands](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NOT NULL,
 CONSTRAINT [brands_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[challan_details]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[challan_details](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[challan_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[measurement_unit_id] [int] NULL,
	[challan_qty] [decimal](18, 2) NULL,
	[received_qty] [decimal](18, 2) NULL,
	[batch_no] [varchar](50) NULL,
	[expire_date] [date] NULL,
	[inventory_status_id] [int] NULL,
	[remarks] [varchar](100) NULL,
	[remaining_qty] [decimal](13, 2) NULL,
 CONSTRAINT [challan_details_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[challan_updates]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[challan_updates](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[so_id] [int] NULL,
	[last_update_date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[challans]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[challans](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[challan_no] [varchar](50) NULL,
	[challan_type] [varchar](20) NULL,
	[challan_date] [date] NOT NULL,
	[remarks] [varchar](100) NULL,
	[challan_referance_no] [varchar](50) NULL,
	[requisition_id] [int] NOT NULL,
	[sender_store_id] [int] NOT NULL,
	[transaction_type_id] [int] NOT NULL,
	[status] [int] NOT NULL,
	[receiver_store_id] [int] NOT NULL,
	[receiver_type] [varchar](100) NULL,
	[receiving_transaction_type] [varchar](50) NULL,
	[received_date] [date] NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NOT NULL,
	[inventory_status_id] [int] NULL,
	[is_close] [tinyint] NULL,
 CONSTRAINT [challans_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[claim_details]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[claim_details](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[claim_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[claim_qty] [decimal](18, 2) NOT NULL,
	[batch_no] [varchar](50) NULL,
	[expire_date] [date] NULL,
	[claim_type] [varchar](100) NOT NULL,
 CONSTRAINT [claim_details_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[claims]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[claims](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[remarks] [varchar](100) NULL,
	[claim_no] [varchar](50) NULL,
	[challan_id] [varchar](50) NULL,
	[sender_store_id] [int] NOT NULL,
	[transaction_type_id] [int] NOT NULL,
	[status] [int] NOT NULL,
	[receiver_store_id] [int] NOT NULL,
	[received_date] [date] NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NOT NULL,
	[inventory_status_id] [int] NULL,
	[challan_date] [varchar](50) NULL,
 CONSTRAINT [claims_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[collections]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[collections](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[memo_id] [varchar](50) NULL,
	[is_credit_collection] [int] NULL,
	[instrument_type] [int] NULL,
	[bank_account_id] [int] NULL,
	[instrumentRefNo] [varchar](15) NULL,
	[instrument_date] [date] NULL,
	[collectionAmount] [decimal](18, 6) NULL,
	[collectionDate] [date] NULL,
	[deposit_id] [int] NULL,
	[created_at] [datetime] NULL,
	[outlet_id] [int] NULL,
	[action] [tinyint] NULL,
 CONSTRAINT [collections_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[combinations]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[combinations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NULL,
	[all_products_in_combination] [varchar](100) NULL,
 CONSTRAINT [combinations_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[csa_memo_details]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[csa_memo_details](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[csa_sales_id] [int] NOT NULL,
	[measurement_unit_id] [int] NOT NULL,
	[sales_qty] [decimal](18, 2) NOT NULL,
	[price] [int] NOT NULL,
	[product_price_id] [int] NOT NULL,
 CONSTRAINT [csa_memo_details_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[csa_sales]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[csa_sales](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[csa_id] [int] NOT NULL,
	[memo_date] [date] NOT NULL,
	[outlet_id] [int] NOT NULL,
	[market_id] [int] NOT NULL,
	[territory_id] [int] NOT NULL,
	[gross_value] [decimal](18, 2) NOT NULL,
 CONSTRAINT [csa_sales_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[current_inventories]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[current_inventories](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[store_id] [int] NOT NULL,
	[inventory_status_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[batch_number] [varchar](100) NULL,
	[expire_date] [date] NULL,
	[m_unit] [varchar](10) NULL,
	[qty] [decimal](18, 2) NOT NULL,
	[updated_at] [datetime] NULL,
	[transaction_type_id] [int] NULL,
 CONSTRAINT [current_inventories_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[current_open_dates]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[current_open_dates](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[hr_id] [int] NOT NULL,
 CONSTRAINT [current_open_dates_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[customer_return]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_return](
	[id] [int] NOT NULL,
	[return_date] [datetime] NOT NULL,
	[outlet_id] [int] NOT NULL,
	[sales_people_id] [int] NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [customer_return_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[customer_return_details]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customer_return_details](
	[id] [int] NOT NULL,
	[customer_return_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[batchid] [int] NULL,
	[measurement_unit_id] [int] NOT NULL,
	[return_qty] [decimal](5, 2) NOT NULL,
	[remarks] [varchar](45) NULL,
	[replaced_qty] [decimal](5, 2) NULL,
 CONSTRAINT [customer_return_details_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[daily_officewise_product_sales_summaries]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[daily_officewise_product_sales_summaries](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
	[office_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[product_measurement_id] [int] NOT NULL,
	[sales_quantity] [decimal](18, 2) NOT NULL,
	[bonus_quantity] [decimal](18, 2) NOT NULL,
	[sales_amount] [decimal](18, 2) NOT NULL,
 CONSTRAINT [daily_officewise_product_sales_summaries_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[daily_so_activity_summaries]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[daily_so_activity_summaries](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
	[sales_person_id] [int] NOT NULL,
	[pharma_ec] [int] NOT NULL,
	[nonpharma_ec] [int] NOT NULL,
	[pharma_oc] [int] NOT NULL,
	[nonpharma_oc] [int] NOT NULL,
	[revenue] [real] NOT NULL,
 CONSTRAINT [daily_so_activity_summaries_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[daily_staffwise_product_sales_summaries]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[daily_staffwise_product_sales_summaries](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
	[sales_person_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[product_measurement_id] [int] NOT NULL,
	[sales_quantity] [decimal](18, 2) NOT NULL,
	[bonus_quantity] [decimal](18, 2) NOT NULL,
	[sales_amount] [decimal](18, 2) NOT NULL,
 CONSTRAINT [daily_staffwise_product_sales_summaries_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[day_closes]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[day_closes](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[territory_id] [int] NULL,
	[sales_person_id] [int] NULL,
	[closing_date] [datetime] NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [day_closes_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[deposits]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[deposits](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[memo_id] [varchar](50) NULL,
	[sales_person_id] [int] NULL,
	[deposit_amount] [float] NULL,
	[deposit_date] [date] NULL,
	[instrument_type] [int] NULL,
	[bank_branch_id] [int] NULL,
	[slip_no] [varchar](50) NULL,
	[instrument_clearing_status] [int] NULL,
	[week_id] [int] NULL,
	[fiscal_year_id] [int] NULL,
	[month_id] [int] NULL,
	[remarks] [varchar](250) NULL,
	[created_at] [datetime] NULL,
	[action] [tinyint] NULL,
 CONSTRAINT [deposits_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[designations]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[designations](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[designation_name] [varchar](50) NOT NULL,
	[serial] [int] NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NOT NULL,
 CONSTRAINT [designations_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[districts]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[districts](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NOT NULL,
	[division_id] [int] NULL,
 CONSTRAINT [districts_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[divisions]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[divisions](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NULL,
 CONSTRAINT [PK_divisions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[doctor_qualifications]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[doctor_qualifications](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
	[doctor_type_id] [int] NULL,
 CONSTRAINT [doctor_qualifications_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[doctor_types]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[doctor_types](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
 CONSTRAINT [PK_doctor_typess] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[doctor_visit_details]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doctor_visit_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[doctor_visit_id] [int] NOT NULL,
	[product_type] [tinyint] NULL,
	[product_id] [int] NULL,
	[quantity] [decimal](12, 2) NULL,
 CONSTRAINT [doctor_visit_details_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[doctor_visits]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[doctor_visits](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[territory_id] [int] NULL,
	[market_id] [int] NULL,
	[sales_person_id] [int] NULL,
	[doctor_id] [int] NULL,
	[visit_date] [datetime] NULL,
	[latitude] [varchar](50) NULL,
	[longitude] [varchar](50) NULL,
	[action] [tinyint] NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
 CONSTRAINT [doctor_visits_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[doctors]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[doctors](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](120) NULL,
	[doctor_qualification_id] [int] NULL,
	[doctor_type_id] [int] NULL,
	[gender] [varchar](6) NULL,
	[territory_id] [int] NULL,
	[market_id] [int] NULL,
	[outlet_id] [int] NULL,
	[clinic_name] [varchar](100) NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NULL,
	[temp_id] [varchar](50) NULL,
	[action] [tinyint] NULL,
 CONSTRAINT [doctors_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[fiscal_years]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[fiscal_years](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[year_code] [varchar](10) NOT NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NOT NULL,
 CONSTRAINT [fiscal_years_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[gift_item_details]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gift_item_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[gift_item_id] [int] NULL,
	[product_id] [int] NULL,
	[quantity] [decimal](13, 2) NULL,
 CONSTRAINT [PK_gift_item_details] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[gift_items]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[gift_items](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[memo_no] [varchar](50) NULL,
	[so_id] [int] NULL,
	[gift_for] [int] NULL,
	[outlet_id] [varchar](50) NULL,
	[doctor_visit_id] [varchar](50) NULL,
	[session_id] [varchar](50) NULL,
	[date] [date] NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NULL,
 CONSTRAINT [PK_gift_items] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[institutes]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[institutes](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[short_name] [varchar](50) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[type] [int] NOT NULL,
	[address] [varchar](255) NOT NULL,
	[email] [varchar](100) NULL,
	[telephone] [varchar](50) NOT NULL,
	[contactname] [varchar](100) NOT NULL,
	[credit_limit] [int] NOT NULL,
	[is_active] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NOT NULL,
 CONSTRAINT [institutes_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[inventory_adjustment_details]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventory_adjustment_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[inventory_adjustment_id] [int] NOT NULL,
	[current_inventory_id] [int] NOT NULL,
	[quantity] [decimal](13, 2) NOT NULL,
 CONSTRAINT [inventory_adjustment_details_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[inventory_adjustments]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[inventory_adjustments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[transaction_type_id] [int] NOT NULL,
	[store_id] [int] NOT NULL,
	[institute_id] [int] NOT NULL,
	[status] [varchar](1) NOT NULL,
	[remarks] [varchar](200) NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NOT NULL,
	[approval_status] [tinyint] NOT NULL,
 CONSTRAINT [inventory_adjustments_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[inventory_statuses]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[inventory_statuses](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[type] [varchar](10) NOT NULL,
 CONSTRAINT [inventory_statuses_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[location_types]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[location_types](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NOT NULL,
 CONSTRAINT [location_types_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[login_tokens]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[login_tokens](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[token] [char](32) NOT NULL,
	[duration] [varchar](32) NOT NULL,
	[used] [smallint] NOT NULL,
	[created] [datetime] NOT NULL,
	[expires] [datetime] NOT NULL,
 CONSTRAINT [login_tokens_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[market_people]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[market_people](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[market_id] [int] NOT NULL,
	[sales_person_id] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NOT NULL,
 CONSTRAINT [market_people_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[market_updates]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[market_updates](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[so_id] [int] NULL,
	[last_update_date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[markets]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[markets](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[code] [varchar](10) NULL,
	[name] [varchar](100) NOT NULL,
	[address] [varchar](255) NULL,
	[location_type_id] [int] NOT NULL,
	[thana_id] [int] NOT NULL,
	[territory_id] [int] NOT NULL,
	[is_active] [int] NOT NULL,
	[action] [tinyint] NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NOT NULL,
	[temp_id] [varchar](50) NULL,
 CONSTRAINT [markets_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[measurement_units]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[measurement_units](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[is_active] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NULL,
 CONSTRAINT [measurement_units_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[memo_details]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[memo_details](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[memo_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[measurement_unit_id] [int] NOT NULL,
	[sales_qty] [decimal](12, 2) NOT NULL,
	[price] [decimal](12, 2) NOT NULL,
	[product_price_id] [int] NULL,
	[bonus_qty] [decimal](12, 2) NOT NULL,
	[offer_id] [int] NOT NULL,
	[bonus_product_id] [int] NULL,
	[current_inventory_id] [int] NULL,
	[bonus_inventory_id] [int] NULL,
 CONSTRAINT [memo_details_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[memo_notifications]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[memo_notifications](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[memo_no] [varchar](50) NULL,
	[memo_date] [datetime] NULL,
	[sales_person_id] [int] NULL,
	[outlet_id] [int] NULL,
	[memo_amount] [decimal](12, 2) NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK_memo_notifications] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[memo_sync_histories]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[memo_sync_histories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NULL,
	[total_memo] [int] NULL,
	[so_id] [int] NULL,
 CONSTRAINT [PK_memo_sync_histories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[memo_updates]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[memo_updates](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[so_id] [int] NULL,
	[last_update_date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[memos]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[memos](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[memo_no] [varchar](50) NULL,
	[memo_date] [datetime] NOT NULL,
	[sales_person_id] [int] NOT NULL,
	[sales_to] [int] NULL,
	[outlet_id] [int] NOT NULL,
	[csa_id] [int] NULL,
	[market_id] [int] NOT NULL,
	[territory_id] [int] NOT NULL,
	[gross_value] [decimal](12, 2) NOT NULL,
	[adjustment_amount] [decimal](12, 2) NULL,
	[adjustment_note] [int] NULL,
	[cash_recieved] [decimal](12, 2) NOT NULL,
	[collection_id] [int] NULL,
	[credit_amount] [decimal](12, 2) NOT NULL,
	[is_active] [int] NULL,
	[credit_collected_amount] [decimal](12, 2) NULL,
	[latitude] [varchar](50) NULL,
	[longitude] [varchar](50) NULL,
	[status] [int] NOT NULL,
	[action] [tinyint] NULL,
 CONSTRAINT [memos_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[message_categories]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[message_categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](100) NOT NULL,
 CONSTRAINT [message_categories_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[message_lists]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[message_lists](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[message_category_id] [int] NOT NULL,
	[message] [text] NOT NULL,
	[sender_id] [int] NOT NULL,
	[message_type] [int] NOT NULL,
	[is_promotional] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
 CONSTRAINT [message_lists_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[message_products]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[message_products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[message_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
 CONSTRAINT [message_products_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[message_receivers]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[message_receivers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[message_id] [int] NOT NULL,
	[receiver_id] [int] NOT NULL,
 CONSTRAINT [message_receivers_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[monthly_officewise_product_sales_summaries]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[monthly_officewise_product_sales_summaries](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fiscal_year_id] [int] NOT NULL,
	[month_id] [int] NOT NULL,
	[office_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[product_measurement_id] [int] NOT NULL,
	[sales_quantity] [decimal](12, 2) NOT NULL,
	[bonus_quantity] [decimal](12, 2) NOT NULL,
	[sales_amount] [decimal](12, 2) NOT NULL,
 CONSTRAINT [monthly_officewise_product_sales_summaries_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[monthly_so_activity_summaries]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[monthly_so_activity_summaries](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fiscal_year_id] [int] NOT NULL,
	[month_id] [int] NOT NULL,
	[sales_person_id] [int] NOT NULL,
	[pharma_ec] [int] NOT NULL,
	[nonpharma_ec] [int] NOT NULL,
	[pharma_oc] [int] NOT NULL,
	[nonpharma_oc] [int] NOT NULL,
	[revenue] [real] NOT NULL,
 CONSTRAINT [monthly_so_activity_summaries_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[monthly_staffwise_product_sales_summaries]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[monthly_staffwise_product_sales_summaries](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fiscal_year_id] [int] NOT NULL,
	[month_id] [int] NOT NULL,
	[sales_person_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[product_measurement_id] [int] NOT NULL,
	[sales_quantity] [decimal](12, 2) NOT NULL,
	[bonus_quantity] [decimal](12, 2) NOT NULL,
	[sales_amount] [decimal](12, 2) NOT NULL,
 CONSTRAINT [monthly_staffwise_product_sales_summaries_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[months]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[months](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[fiscal_year_id] [int] NOT NULL,
	[month] [varchar](10) NOT NULL,
	[year] [varchar](10) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NOT NULL,
	[YearID] [int] NOT NULL,
 CONSTRAINT [months_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[offers]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[offers](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[reference_id] [int] NOT NULL,
	[offer_type] [varchar](10) NOT NULL,
	[combination_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[price] [int] NOT NULL,
 CONSTRAINT [offers_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[office_people]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[office_people](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[office_id] [int] NOT NULL,
	[sales_person_id] [int] NOT NULL,
	[effective_date] [date] NOT NULL,
	[is_active] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NOT NULL,
 CONSTRAINT [office_people_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[office_types]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[office_types](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type_name] [varchar](50) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NOT NULL,
 CONSTRAINT [office_types_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[offices]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[offices](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[office_code] [varchar](10) NULL,
	[office_name] [varchar](100) NOT NULL,
	[office_type_id] [int] NOT NULL,
	[parent_office_id] [int] NOT NULL,
	[phone] [varchar](50) NULL,
	[email] [varchar](100) NULL,
	[address] [varchar](100) NULL,
	[lft] [int] NOT NULL,
	[rght] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_by] [int] NOT NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [offices_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[outlet_categories]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[outlet_categories](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](100) NOT NULL,
	[is_active] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NOT NULL,
 CONSTRAINT [outlet_categories_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[outlet_ngo_prices]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[outlet_ngo_prices](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[outlet_id] [int] NOT NULL,
	[institute_id] [int] NOT NULL,
	[product_price_id] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NULL,
	[outlet_name] [varchar](100) NOT NULL,
	[type_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[outlet_updates]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[outlet_updates](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[so_id] [int] NULL,
	[last_update_date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[outlets]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[outlets](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[in_charge] [varchar](100) NULL,
	[ownar_name] [varchar](100) NULL,
	[address] [varchar](255) NULL,
	[telephone] [varchar](15) NULL,
	[mobile] [varchar](20) NULL,
	[market_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[is_pharma_type] [int] NOT NULL,
	[is_ngo] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NOT NULL,
	[temp_id] [varchar](50) NULL,
	[code] [varchar](50) NULL,
	[latitude] [varchar](50) NULL,
	[longitude] [varchar](50) NULL,
	[institute_id] [int] NULL,
	[project_id] [int] NULL,
	[action] [tinyint] NULL,
	[bonus_type_id] [tinyint] NULL,
 CONSTRAINT [outlets_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product_categories]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product_categories](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[parent_id] [int] NULL,
	[is_pharma_product] [smallint] NOT NULL,
	[lft] [int] NOT NULL,
	[rght] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_by] [int] NOT NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [product_categories_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product_combination_updates]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_combination_updates](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[so_id] [int] NULL,
	[last_update_date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[product_combinations]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_combinations](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[product_price_id] [int] NOT NULL,
	[combination_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[indivisual_or_total] [int] NOT NULL,
	[min_qty] [decimal](12, 2) NOT NULL,
	[min_total_qty] [decimal](12, 2) NOT NULL,
	[price] [decimal](12, 2) NOT NULL,
	[parent_slab_id] [int] NOT NULL,
	[offer_type] [int] NOT NULL,
	[effective_date] [date] NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NULL,
	[end_date] [date] NULL,
 CONSTRAINT [product_combinations_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[product_convert_history]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_convert_history](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[store_id] [int] NOT NULL,
	[from_product_id] [int] NOT NULL,
	[to_product_id] [int] NOT NULL,
	[from_status_id] [int] NOT NULL,
	[to_status_id] [int] NOT NULL,
	[quantity] [decimal](12, 2) NOT NULL,
	[type] [smallint] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
 CONSTRAINT [product_convert_history_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[product_measurements]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_measurements](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[measurement_unit_id] [int] NOT NULL,
	[is_base] [int] NULL,
	[qty_in_base] [decimal](12, 2) NOT NULL,
	[is_active] [int] NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[updated_by] [int] NULL,
 CONSTRAINT [product_measurements_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[product_price_updates]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_price_updates](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[so_id] [int] NULL,
	[last_update_date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[product_prices]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_prices](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[target_custommer] [int] NOT NULL,
	[measurement_unit_id] [int] NOT NULL,
	[institute_id] [int] NOT NULL,
	[effective_date] [date] NOT NULL,
	[is_active] [int] NOT NULL,
	[general_price] [decimal](12, 2) NOT NULL,
	[vat] [decimal](12, 2) NULL,
	[has_combination] [int] NOT NULL,
	[has_price_slot] [smallint] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NULL,
	[is_vat_applicable] [int] NOT NULL,
	[end_date] [date] NULL,
	[project_id] [int] NULL,
 CONSTRAINT [PK__product___3213E83F3437DBD6] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[product_type]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product_type](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[updated_by] [int] NOT NULL,
 CONSTRAINT [product_type_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product_updates]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_updates](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[so_id] [int] NULL,
	[last_update_date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[products]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[products](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[product_code] [varchar](10) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[product_category_id] [int] NOT NULL,
	[sub_category_id] [int] NOT NULL,
	[brand_id] [int] NOT NULL,
	[variant_id] [int] NOT NULL,
	[base_measurement_unit_id] [int] NOT NULL,
	[sales_measurement_unit_id] [int] NOT NULL,
	[challan_measurement_unit_id] [int] NOT NULL,
	[return_measurement_unit_id] [int] NOT NULL,
	[is_active] [int] NOT NULL,
	[product_type_id] [smallint] NOT NULL,
	[is_pharma] [int] NOT NULL,
	[cyp] [int] NULL,
	[maintain_batch] [int] NOT NULL,
	[is_maintain_expire_date] [smallint] NOT NULL,
	[order] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NULL,
 CONSTRAINT [products_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[program_types]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[program_types](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_program_types] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[programs]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[programs](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[territory_id] [int] NULL,
	[market_id] [int] NULL,
	[outlet_id] [int] NULL,
	[program_type_id] [tinyint] NULL,
	[officer_id] [int] NULL,
	[member_type] [tinyint] NULL,
	[code] [varchar](50) NULL,
	[assigned_date] [date] NULL,
	[deassigned_date] [date] NULL,
	[status] [tinyint] NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NULL,
	[deassigned_by] [int] NULL,
	[doctor_id] [int] NULL,
 CONSTRAINT [PK_programs_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[project_ngo_outlets]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[project_ngo_outlets](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[project_id] [int] NOT NULL,
	[outlet_id] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NOT NULL,
 CONSTRAINT [project_ngo_outlets_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[projects]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[projects](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NOT NULL,
	[is_active] [int] NOT NULL,
	[institute_id] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NOT NULL,
 CONSTRAINT [projects_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[reciever_office_person]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reciever_office_person](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[receive_type] [int] NOT NULL,
	[office_id] [int] NOT NULL,
	[sales_person_id] [int] NOT NULL,
 CONSTRAINT [reciever_office_person_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[requisition_details]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[requisition_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[requisition_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[batch_no] [varchar](20) NULL,
	[expire_date] [date] NULL,
	[inventory_status_id] [int] NULL,
	[measurement_unit_id] [int] NULL,
	[qty] [decimal](12, 2) NOT NULL,
	[remaining_qty] [decimal](12, 2) NULL,
	[remarks] [varchar](100) NULL,
 CONSTRAINT [requisition_details_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[requisitions]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[requisitions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](100) NOT NULL,
	[do_no] [varchar](12) NULL,
	[sender_store_id] [int] NOT NULL,
	[receiver_store_id] [int] NOT NULL,
	[remarks] [text] NULL,
	[is_do] [smallint] NULL,
	[status] [smallint] NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NULL,
 CONSTRAINT [requisitions_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[return_challan_details]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[return_challan_details](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[challan_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[measurement_unit_id] [int] NOT NULL,
	[challan_qty] [decimal](12, 2) NOT NULL,
	[received_qty] [decimal](12, 2) NOT NULL,
	[batch_no] [varchar](50) NULL,
	[expire_date] [date] NULL,
	[inventory_status_id] [int] NOT NULL,
	[remarks] [varchar](100) NULL,
	[remaining_qty] [decimal](13, 2) NULL,
 CONSTRAINT [return_challan_details_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[return_challans]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[return_challans](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[challan_no] [varchar](50) NULL,
	[challan_type] [varchar](20) NULL,
	[challan_date] [date] NOT NULL,
	[remarks] [varchar](100) NULL,
	[challan_referance_no] [varchar](50) NULL,
	[requisition_id] [int] NOT NULL,
	[sender_store_id] [int] NOT NULL,
	[transaction_type_id] [int] NOT NULL,
	[status] [int] NOT NULL,
	[receiver_store_id] [int] NOT NULL,
	[receiver_type] [varchar](100) NULL,
	[receiving_transaction_type] [varchar](50) NULL,
	[received_date] [date] NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NOT NULL,
	[inventory_status_id] [int] NULL,
	[is_close] [tinyint] NULL,
 CONSTRAINT [return_challans_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sale_target_months]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sale_target_months](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sale_target_id] [int] NOT NULL,
	[aso_id] [int] NOT NULL,
	[territory_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[fiscal_year_id] [int] NOT NULL,
	[month_id] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[target_quantity] [decimal](12, 2) NULL,
	[target_amount] [decimal](12, 2) NULL,
	[updated_at] [datetime] NULL,
	[effective_call] [int] NULL,
	[outlet_coverage] [int] NULL,
 CONSTRAINT [sale_target_months_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sale_targets]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sale_targets](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fiscal_year_id] [int] NOT NULL,
	[target_category] [smallint] NOT NULL,
	[aso_id] [int] NOT NULL,
	[territory_id] [int] NOT NULL,
	[so_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[measurement_unit_id] [int] NOT NULL,
	[quantity] [decimal](12, 2) NOT NULL,
	[amount] [decimal](12, 2) NOT NULL,
	[outlet_coverage] [real] NOT NULL,
	[effective_call] [real] NOT NULL,
	[session] [real] NOT NULL,
	[session_participant] [real] NOT NULL,
	[created] [datetime] NOT NULL,
	[updated] [datetime] NULL,
	[target_type] [int] NOT NULL,
	[target_type_id] [int] NULL,
	[pharma] [varchar](50) NULL,
	[non_pharma] [varchar](50) NULL,
 CONSTRAINT [sale_targets_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sales_people]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sales_people](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[code] [varchar](10) NULL,
	[name] [varchar](100) NOT NULL,
	[designation_id] [int] NOT NULL,
	[parent_id] [int] NOT NULL,
	[office_id] [int] NOT NULL,
	[territory_id] [int] NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NOT NULL,
	[last_data_push_time] [datetime] NULL,
 CONSTRAINT [sales_people_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[session_details]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[session_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[session_id] [int] NULL,
	[product_id] [int] NULL,
	[quantity] [decimal](13, 2) NULL,
 CONSTRAINT [PK_session_details] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sessions]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sessions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[territory_id] [int] NULL,
	[so_id] [int] NULL,
	[name] [varchar](100) NULL,
	[total_participant] [int] NULL,
	[total_attend] [int] NULL,
	[total_male] [int] NULL,
	[total_female] [int] NULL,
	[session_date] [date] NULL,
	[session_arranged_date] [date] NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NULL,
	[action] [tinyint] NULL,
 CONSTRAINT [PK_sessions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[store_types]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[store_types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [store_types_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[stores]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[stores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[store_type_id] [smallint] NOT NULL,
	[office_id] [int] NOT NULL,
	[territory_id] [int] NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NOT NULL,
 CONSTRAINT [stores_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[target_for_others]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[target_for_others](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[target_id] [int] NOT NULL,
	[period_id] [int] NOT NULL,
	[target_qty] [decimal](12, 2) NOT NULL,
 CONSTRAINT [target_for_others_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[target_for_product_sales]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[target_for_product_sales](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[target_id] [int] NOT NULL,
	[period_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[target_qty] [decimal](12, 2) NOT NULL,
	[measurement_unit_id] [int] NOT NULL,
	[target_amount] [decimal](12, 2) NOT NULL,
	[assigned_qty] [decimal](12, 2) NOT NULL,
	[assigned_amount] [decimal](12, 2) NOT NULL,
 CONSTRAINT [target_for_product_sales_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[target_types]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[target_types](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[target_type_name] [varchar](50) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NOT NULL,
 CONSTRAINT [target_types_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[targets]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[targets](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[target_period_type] [smallint] NOT NULL,
	[office_or_person] [varchar](50) NOT NULL,
	[office_sales_person_id] [int] NOT NULL,
	[target_type_id] [int] NOT NULL,
 CONSTRAINT [targets_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[territories]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[territories](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[office_id] [int] NOT NULL,
	[is_active] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NOT NULL,
	[is_assigned] [tinyint] NOT NULL,
 CONSTRAINT [territories_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[territory_assign_histories]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[territory_assign_histories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[so_id] [int] NOT NULL,
	[territory_id] [int] NOT NULL,
	[assign_type] [tinyint] NOT NULL,
	[date] [date] NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NOT NULL,
 CONSTRAINT [PK_territory_assign_history] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[territory_people]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[territory_people](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[territory_id] [int] NOT NULL,
	[sales_person_id] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NOT NULL,
 CONSTRAINT [territory_people_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[thana_territories]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[thana_territories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[thana_id] [int] NOT NULL,
	[territory_id] [int] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[action] [int] NULL,
 CONSTRAINT [thana_territories_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[thanas]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[thanas](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[district_id] [int] NOT NULL,
	[is_active] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NOT NULL,
 CONSTRAINT [thanas_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[transaction_types]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[transaction_types](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[transaction_code] [varchar](10) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[side] [varchar](50) NOT NULL,
	[inout] [smallint] NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NOT NULL,
 CONSTRAINT [transaction_types_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[user_group_permissions]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user_group_permissions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_group_id] [bigint] NOT NULL,
	[controller] [varchar](50) NOT NULL,
	[action] [varchar](100) NOT NULL,
	[allowed] [tinyint] NOT NULL,
 CONSTRAINT [user_group_permissions_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[user_groups]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user_groups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[alias_name] [varchar](100) NULL,
	[allowRegistration] [int] NOT NULL,
	[created] [datetime] NULL,
	[modified] [datetime] NULL,
 CONSTRAINT [user_groups_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[users]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_group_id] [bigint] NULL,
	[sales_person_id] [int] NULL,
	[username] [varchar](100) NULL,
	[password] [varchar](255) NULL,
	[email] [varchar](100) NULL,
	[name] [varchar](100) NULL,
	[active] [varchar](3) NULL,
	[created] [datetime] NULL,
	[modified] [datetime] NULL,
 CONSTRAINT [users_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[variants]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[variants](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NOT NULL,
 CONSTRAINT [variants_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[visit_plan_lists]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[visit_plan_lists](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[aso_id] [int] NOT NULL,
	[so_id] [int] NOT NULL,
	[market_id] [int] NOT NULL,
	[visit_plan_date] [date] NOT NULL,
	[visited_date] [date] NULL,
	[is_out_of_plan] [int] NULL,
	[visit_status] [varchar](20) NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [visit_plan_lists_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[weeks]    Script Date: 6/4/2017 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[weeks](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[week_name] [varchar](100) NOT NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NOT NULL,
	[month_id] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NOT NULL,
 CONSTRAINT [weeks_PRIMARY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[brands] ADD  DEFAULT ('0') FOR [updated_by]
GO
ALTER TABLE [dbo].[challan_details] ADD  CONSTRAINT [DF__challan_d__chall__489AC854]  DEFAULT ('0') FOR [challan_qty]
GO
ALTER TABLE [dbo].[challan_details] ADD  CONSTRAINT [DF__challan_d__recei__498EEC8D]  DEFAULT ('0') FOR [received_qty]
GO
ALTER TABLE [dbo].[challan_details] ADD  CONSTRAINT [DF__challan_d__inven__4A8310C6]  DEFAULT ('0') FOR [inventory_status_id]
GO
ALTER TABLE [dbo].[challans] ADD  CONSTRAINT [DF__challans__requis__4B7734FF]  DEFAULT ((0)) FOR [requisition_id]
GO
ALTER TABLE [dbo].[challans] ADD  CONSTRAINT [DF__challans__status__4C6B5938]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[challans] ADD  CONSTRAINT [DF__challans__update__4D5F7D71]  DEFAULT ('0') FOR [updated_by]
GO
ALTER TABLE [dbo].[challans] ADD  CONSTRAINT [DF__challans__invent__4E53A1AA]  DEFAULT (NULL) FOR [inventory_status_id]
GO
ALTER TABLE [dbo].[current_inventories] ADD  CONSTRAINT [DF__current_i__store__4F47C5E3]  DEFAULT ('0') FOR [store_id]
GO
ALTER TABLE [dbo].[current_inventories] ADD  CONSTRAINT [DF__current_i__inven__503BEA1C]  DEFAULT ('0') FOR [inventory_status_id]
GO
ALTER TABLE [dbo].[current_inventories] ADD  CONSTRAINT [DF__current_i__produ__51300E55]  DEFAULT ('0') FOR [product_id]
GO
ALTER TABLE [dbo].[current_inventories] ADD  CONSTRAINT [DF__current_i__batch__5224328E]  DEFAULT ('0') FOR [batch_number]
GO
ALTER TABLE [dbo].[designations] ADD  CONSTRAINT [DF__designati__updat__531856C7]  DEFAULT ('0') FOR [updated_by]
GO
ALTER TABLE [dbo].[districts] ADD  DEFAULT ('0') FOR [updated_by]
GO
ALTER TABLE [dbo].[fiscal_years] ADD  DEFAULT ('0') FOR [updated_by]
GO
ALTER TABLE [dbo].[institutes] ADD  DEFAULT ('0') FOR [credit_limit]
GO
ALTER TABLE [dbo].[institutes] ADD  DEFAULT ('0') FOR [updated_by]
GO
ALTER TABLE [dbo].[inventory_adjustments] ADD  DEFAULT ('0') FOR [institute_id]
GO
ALTER TABLE [dbo].[inventory_adjustments] ADD  DEFAULT ('0') FOR [updated_by]
GO
ALTER TABLE [dbo].[inventory_adjustments] ADD  DEFAULT ('0') FOR [approval_status]
GO
ALTER TABLE [dbo].[inventory_statuses] ADD  DEFAULT ('0') FOR [type]
GO
ALTER TABLE [dbo].[location_types] ADD  DEFAULT ('0') FOR [updated_by]
GO
ALTER TABLE [dbo].[login_tokens] ADD  DEFAULT ((0)) FOR [used]
GO
ALTER TABLE [dbo].[market_people] ADD  DEFAULT ('0') FOR [updated_by]
GO
ALTER TABLE [dbo].[markets] ADD  CONSTRAINT [DF_markets_territory_id]  DEFAULT ((0)) FOR [territory_id]
GO
ALTER TABLE [dbo].[markets] ADD  CONSTRAINT [DF__markets__is_acti__5AB9788F]  DEFAULT ('0') FOR [is_active]
GO
ALTER TABLE [dbo].[markets] ADD  CONSTRAINT [DF_markets_action]  DEFAULT ((0)) FOR [action]
GO
ALTER TABLE [dbo].[markets] ADD  CONSTRAINT [DF__markets__updated__5BAD9CC8]  DEFAULT ('0') FOR [updated_by]
GO
ALTER TABLE [dbo].[measurement_units] ADD  DEFAULT ('0') FOR [is_active]
GO
ALTER TABLE [dbo].[measurement_units] ADD  DEFAULT ('0') FOR [updated_by]
GO
ALTER TABLE [dbo].[memo_details] ADD  CONSTRAINT [DF__memo_deta__bonus__625A9A57]  DEFAULT ((0)) FOR [bonus_qty]
GO
ALTER TABLE [dbo].[memo_details] ADD  CONSTRAINT [DF__memo_deta__offer__634EBE90]  DEFAULT ((0)) FOR [offer_id]
GO
ALTER TABLE [dbo].[memos] ADD  CONSTRAINT [DF_memos_action]  DEFAULT ((0)) FOR [action]
GO
ALTER TABLE [dbo].[message_lists] ADD  DEFAULT ((0)) FOR [is_promotional]
GO
ALTER TABLE [dbo].[months] ADD  DEFAULT ('0') FOR [updated_by]
GO
ALTER TABLE [dbo].[months] ADD  DEFAULT ('0') FOR [YearID]
GO
ALTER TABLE [dbo].[office_people] ADD  DEFAULT ('0') FOR [updated_by]
GO
ALTER TABLE [dbo].[office_types] ADD  DEFAULT ('0') FOR [updated_by]
GO
ALTER TABLE [dbo].[offices] ADD  CONSTRAINT [DF__offices__parent___65370702]  DEFAULT ('0') FOR [parent_office_id]
GO
ALTER TABLE [dbo].[offices] ADD  CONSTRAINT [DF__offices__updated__662B2B3B]  DEFAULT ('0') FOR [updated_by]
GO
ALTER TABLE [dbo].[outlet_categories] ADD  DEFAULT ('0') FOR [is_active]
GO
ALTER TABLE [dbo].[outlet_categories] ADD  DEFAULT ('0') FOR [updated_by]
GO
ALTER TABLE [dbo].[outlet_ngo_prices] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[outlets] ADD  CONSTRAINT [DF__outlets__address__662B2B3B]  DEFAULT ('0') FOR [address]
GO
ALTER TABLE [dbo].[outlets] ADD  CONSTRAINT [DF__outlets__is_phar__671F4F74]  DEFAULT ('0') FOR [is_pharma_type]
GO
ALTER TABLE [dbo].[outlets] ADD  CONSTRAINT [DF__outlets__is_ngo__681373AD]  DEFAULT ('0') FOR [is_ngo]
GO
ALTER TABLE [dbo].[outlets] ADD  CONSTRAINT [DF__outlets__updated__690797E6]  DEFAULT ('0') FOR [updated_by]
GO
ALTER TABLE [dbo].[outlets] ADD  CONSTRAINT [DF_outlets_project_id]  DEFAULT ((0)) FOR [project_id]
GO
ALTER TABLE [dbo].[product_categories] ADD  DEFAULT ('0') FOR [parent_id]
GO
ALTER TABLE [dbo].[product_categories] ADD  DEFAULT ((0)) FOR [is_pharma_product]
GO
ALTER TABLE [dbo].[product_categories] ADD  DEFAULT ('0') FOR [updated_by]
GO
ALTER TABLE [dbo].[product_combinations] ADD  CONSTRAINT [DF__product_c__produ__756D6ECB]  DEFAULT ('0') FOR [product_price_id]
GO
ALTER TABLE [dbo].[product_combinations] ADD  CONSTRAINT [DF__product_c__combi__76619304]  DEFAULT ('0') FOR [combination_id]
GO
ALTER TABLE [dbo].[product_combinations] ADD  CONSTRAINT [DF__product_c__produ__7755B73D]  DEFAULT ('0') FOR [product_id]
GO
ALTER TABLE [dbo].[product_combinations] ADD  CONSTRAINT [DF__product_c__indiv__7849DB76]  DEFAULT ('0') FOR [indivisual_or_total]
GO
ALTER TABLE [dbo].[product_combinations] ADD  CONSTRAINT [DF__product_c__min_q__793DFFAF]  DEFAULT ('0') FOR [min_qty]
GO
ALTER TABLE [dbo].[product_combinations] ADD  CONSTRAINT [DF__product_c__min_t__7A3223E8]  DEFAULT ('0') FOR [min_total_qty]
GO
ALTER TABLE [dbo].[product_combinations] ADD  CONSTRAINT [DF__product_c__price__7B264821]  DEFAULT ('0') FOR [price]
GO
ALTER TABLE [dbo].[product_combinations] ADD  CONSTRAINT [DF__product_c__paren__7C1A6C5A]  DEFAULT ('0') FOR [parent_slab_id]
GO
ALTER TABLE [dbo].[product_combinations] ADD  CONSTRAINT [DF__product_c__offer__7D0E9093]  DEFAULT ('0') FOR [offer_type]
GO
ALTER TABLE [dbo].[product_prices] ADD  CONSTRAINT [DF__product_p__targe__7E02B4CC]  DEFAULT ((0)) FOR [target_custommer]
GO
ALTER TABLE [dbo].[product_prices] ADD  CONSTRAINT [DF__product_p__measu__7EF6D905]  DEFAULT ((0)) FOR [measurement_unit_id]
GO
ALTER TABLE [dbo].[product_prices] ADD  CONSTRAINT [DF__product_p__insti__7FEAFD3E]  DEFAULT ((0)) FOR [institute_id]
GO
ALTER TABLE [dbo].[product_prices] ADD  CONSTRAINT [DF__product_p__is_ac__00DF2177]  DEFAULT ((0)) FOR [is_active]
GO
ALTER TABLE [dbo].[product_prices] ADD  CONSTRAINT [DF__product_p__gener__01D345B0]  DEFAULT ((0)) FOR [general_price]
GO
ALTER TABLE [dbo].[product_prices] ADD  CONSTRAINT [DF__product_p__has_c__02C769E9]  DEFAULT ((0)) FOR [has_combination]
GO
ALTER TABLE [dbo].[product_prices] ADD  CONSTRAINT [DF__product_p__has_p__03BB8E22]  DEFAULT ((0)) FOR [has_price_slot]
GO
ALTER TABLE [dbo].[product_prices] ADD  CONSTRAINT [DF__product_p__is_va__04AFB25B]  DEFAULT ('0') FOR [is_vat_applicable]
GO
ALTER TABLE [dbo].[product_prices] ADD  CONSTRAINT [DF__product_p__proje__05A3D694]  DEFAULT ((0)) FOR [project_id]
GO
ALTER TABLE [dbo].[products] ADD  CONSTRAINT [DF__products__produc__02C769E9]  DEFAULT ('0') FOR [product_code]
GO
ALTER TABLE [dbo].[products] ADD  CONSTRAINT [DF__products__sub_ca__03BB8E22]  DEFAULT ('0') FOR [sub_category_id]
GO
ALTER TABLE [dbo].[products] ADD  CONSTRAINT [DF__products__is_act__04AFB25B]  DEFAULT ('0') FOR [is_active]
GO
ALTER TABLE [dbo].[products] ADD  CONSTRAINT [DF__products__is_pha__05A3D694]  DEFAULT ('0') FOR [is_pharma]
GO
ALTER TABLE [dbo].[products] ADD  CONSTRAINT [DF__products__update__0697FACD]  DEFAULT ('0') FOR [updated_by]
GO
ALTER TABLE [dbo].[project_ngo_outlets] ADD  DEFAULT ('0') FOR [updated_by]
GO
ALTER TABLE [dbo].[projects] ADD  DEFAULT ('0') FOR [is_active]
GO
ALTER TABLE [dbo].[projects] ADD  DEFAULT ('0') FOR [updated_by]
GO
ALTER TABLE [dbo].[requisitions] ADD  CONSTRAINT [DF__requisiti__statu__0E391C95]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[return_challan_details] ADD  CONSTRAINT [DF__return_ch__chall__0F2D40CE]  DEFAULT ('0') FOR [challan_qty]
GO
ALTER TABLE [dbo].[return_challan_details] ADD  CONSTRAINT [DF__return_ch__recei__10216507]  DEFAULT ('0') FOR [received_qty]
GO
ALTER TABLE [dbo].[return_challan_details] ADD  CONSTRAINT [DF__return_ch__inven__11158940]  DEFAULT ('0') FOR [inventory_status_id]
GO
ALTER TABLE [dbo].[return_challans] ADD  DEFAULT ((0)) FOR [requisition_id]
GO
ALTER TABLE [dbo].[return_challans] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[return_challans] ADD  DEFAULT ('0') FOR [updated_by]
GO
ALTER TABLE [dbo].[return_challans] ADD  DEFAULT (NULL) FOR [inventory_status_id]
GO
ALTER TABLE [dbo].[sale_target_months] ADD  CONSTRAINT [DF__sale_targ__produ__15DA3E5D]  DEFAULT ('0') FOR [product_id]
GO
ALTER TABLE [dbo].[sale_target_months] ADD  CONSTRAINT [DF__sale_targ__targe__16CE6296]  DEFAULT ((0)) FOR [target_amount]
GO
ALTER TABLE [dbo].[sale_target_months] ADD  CONSTRAINT [DF__sale_targ__effec__17C286CF]  DEFAULT ((0)) FOR [effective_call]
GO
ALTER TABLE [dbo].[sale_target_months] ADD  CONSTRAINT [DF__sale_targ__outle__18B6AB08]  DEFAULT ((0)) FOR [outlet_coverage]
GO
ALTER TABLE [dbo].[sale_targets] ADD  CONSTRAINT [DF__sale_targ__aso_i__19AACF41]  DEFAULT ((0)) FOR [aso_id]
GO
ALTER TABLE [dbo].[sale_targets] ADD  CONSTRAINT [DF__sale_targ__terri__1A9EF37A]  DEFAULT ('0') FOR [territory_id]
GO
ALTER TABLE [dbo].[sale_targets] ADD  CONSTRAINT [DF__sale_targ__so_id__1B9317B3]  DEFAULT ('0') FOR [so_id]
GO
ALTER TABLE [dbo].[sale_targets] ADD  CONSTRAINT [DF__sale_targ__produ__1C873BEC]  DEFAULT ('0') FOR [product_id]
GO
ALTER TABLE [dbo].[sale_targets] ADD  CONSTRAINT [DF__sale_targ__measu__1D7B6025]  DEFAULT ('0') FOR [measurement_unit_id]
GO
ALTER TABLE [dbo].[sale_targets] ADD  CONSTRAINT [DF__sale_targ__quant__1E6F845E]  DEFAULT ('0') FOR [quantity]
GO
ALTER TABLE [dbo].[sale_targets] ADD  CONSTRAINT [DF__sale_targ__amoun__1F63A897]  DEFAULT ('0') FOR [amount]
GO
ALTER TABLE [dbo].[sale_targets] ADD  CONSTRAINT [DF__sale_targ__outle__2057CCD0]  DEFAULT ((0)) FOR [outlet_coverage]
GO
ALTER TABLE [dbo].[sale_targets] ADD  CONSTRAINT [DF__sale_targ__effec__214BF109]  DEFAULT ((0)) FOR [effective_call]
GO
ALTER TABLE [dbo].[sale_targets] ADD  CONSTRAINT [DF__sale_targ__sessi__22401542]  DEFAULT ((0)) FOR [session]
GO
ALTER TABLE [dbo].[sale_targets] ADD  CONSTRAINT [DF__sale_targ__sessi__2334397B]  DEFAULT ((0)) FOR [session_participant]
GO
ALTER TABLE [dbo].[sale_targets] ADD  CONSTRAINT [DF__sale_targ__targe__24285DB4]  DEFAULT ('0') FOR [target_type]
GO
ALTER TABLE [dbo].[sale_targets] ADD  CONSTRAINT [DF__sale_targ__targe__251C81ED]  DEFAULT ((0)) FOR [target_type_id]
GO
ALTER TABLE [dbo].[sales_people] ADD  CONSTRAINT [DF__sales_peo__paren__0D44F85C]  DEFAULT ('0') FOR [parent_id]
GO
ALTER TABLE [dbo].[sales_people] ADD  CONSTRAINT [DF__sales_peo__terri__0E391C95]  DEFAULT ((0)) FOR [territory_id]
GO
ALTER TABLE [dbo].[sales_people] ADD  CONSTRAINT [DF__sales_peo__updat__0F2D40CE]  DEFAULT ('0') FOR [updated_by]
GO
ALTER TABLE [dbo].[stores] ADD  DEFAULT ('0') FOR [updated_by]
GO
ALTER TABLE [dbo].[target_types] ADD  DEFAULT ('0') FOR [updated_by]
GO
ALTER TABLE [dbo].[territories] ADD  DEFAULT ('0') FOR [is_active]
GO
ALTER TABLE [dbo].[territories] ADD  DEFAULT ('0') FOR [updated_by]
GO
ALTER TABLE [dbo].[territories] ADD  CONSTRAINT [DF_territories_is_assigned]  DEFAULT ((0)) FOR [is_assigned]
GO
ALTER TABLE [dbo].[territory_people] ADD  DEFAULT ('0') FOR [updated_by]
GO
ALTER TABLE [dbo].[thana_territories] ADD  CONSTRAINT [DF_thana_territories_action]  DEFAULT ((0)) FOR [action]
GO
ALTER TABLE [dbo].[thanas] ADD  DEFAULT ('0') FOR [is_active]
GO
ALTER TABLE [dbo].[thanas] ADD  DEFAULT ('0') FOR [updated_by]
GO
ALTER TABLE [dbo].[transaction_types] ADD  DEFAULT ('0') FOR [updated_by]
GO
ALTER TABLE [dbo].[user_group_permissions] ADD  DEFAULT ((1)) FOR [allowed]
GO
ALTER TABLE [dbo].[user_groups] ADD  DEFAULT ((1)) FOR [allowRegistration]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ('0') FOR [active]
GO
ALTER TABLE [dbo].[variants] ADD  DEFAULT ('0') FOR [updated_by]
GO
ALTER TABLE [dbo].[weeks] ADD  DEFAULT ('0') FOR [updated_by]
GO
ALTER TABLE [dbo].[bonus_cards]  WITH CHECK ADD  CONSTRAINT [FK_bonus_cards_bonus_cards] FOREIGN KEY([id])
REFERENCES [dbo].[bonus_cards] ([id])
GO
ALTER TABLE [dbo].[bonus_cards] CHECK CONSTRAINT [FK_bonus_cards_bonus_cards]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'brands', @level2type=N'COLUMN',@level2name=N'updated_at'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'challan_details', @level2type=N'COLUMN',@level2name=N'expire_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'challan_details', @level2type=N'COLUMN',@level2name=N'remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'augenerate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'challans', @level2type=N'COLUMN',@level2name=N'challan_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0-ChallanFromCWH, 1-Issue to SO, 2-Transfer from ASO to ASO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'challans', @level2type=N'COLUMN',@level2name=N'challan_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'challans', @level2type=N'COLUMN',@level2name=N'remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'for SMC, CWH generated reference number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'challans', @level2type=N'COLUMN',@level2name=N'challan_referance_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'for SMC, DO number will be stored here if this challan is against a DO. If it is not against reuisition/DO then default value is 0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'challans', @level2type=N'COLUMN',@level2name=N'requisition_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Store ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'challans', @level2type=N'COLUMN',@level2name=N'sender_store_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TransactionTypes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'challans', @level2type=N'COLUMN',@level2name=N'transaction_type_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0=Pending,1=Received' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'challans', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Store ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'challans', @level2type=N'COLUMN',@level2name=N'receiver_store_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Office, Supplier, HR// Not needed for now. If future if needed we will use this' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'challans', @level2type=N'COLUMN',@level2name=N'receiver_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'challans', @level2type=N'COLUMN',@level2name=N'receiving_transaction_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'challans', @level2type=N'COLUMN',@level2name=N'received_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'challans', @level2type=N'COLUMN',@level2name=N'updated_at'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'challans', @level2type=N'COLUMN',@level2name=N'inventory_status_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'on the spot cash or credit collection' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'collections', @level2type=N'COLUMN',@level2name=N'is_credit_collection'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Check/Transfer. No etc.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'collections', @level2type=N'COLUMN',@level2name=N'instrumentRefNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'combinations', @level2type=N'COLUMN',@level2name=N'updated_at'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'combinations', @level2type=N'COLUMN',@level2name=N'updated_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'combinations', @level2type=N'COLUMN',@level2name=N'all_products_in_combination'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'no need to use this field for now.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'current_inventories', @level2type=N'COLUMN',@level2name=N'inventory_status_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'current_inventories', @level2type=N'COLUMN',@level2name=N'expire_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'current_inventories', @level2type=N'COLUMN',@level2name=N'm_unit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'current_inventories', @level2type=N'COLUMN',@level2name=N'updated_at'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0-Received from Outlets, 1-Transferred to ASO, 3- Requested to CWH, 4-Issued to SO, 5-Replaced provided to outlet' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'customer_return', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Return NCP (Damaged) products from outlets.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'customer_return'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'check/cash' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'deposits', @level2type=N'COLUMN',@level2name=N'instrument_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'check bank branch' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'deposits', @level2type=N'COLUMN',@level2name=N'bank_branch_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'is it cleared or bounced' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'deposits', @level2type=N'COLUMN',@level2name=N'instrument_clearing_status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reason for not clearing' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'deposits', @level2type=N'COLUMN',@level2name=N'remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'clearing date on check after clearing' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'deposits', @level2type=N'COLUMN',@level2name=N'created_at'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'districts', @level2type=N'COLUMN',@level2name=N'updated_at'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 = sample,  2= gift' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doctor_visit_details', @level2type=N'COLUMN',@level2name=N'product_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fiscal_years', @level2type=N'COLUMN',@level2name=N'updated_at'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=Outlet, 2=Doctor Visit, 3=Session' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gift_items', @level2type=N'COLUMN',@level2name=N'gift_for'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0-NGO, 1…' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'institutes', @level2type=N'COLUMN',@level2name=N'type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'institutes', @level2type=N'COLUMN',@level2name=N'email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'institutes', @level2type=N'COLUMN',@level2name=N'updated_at'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'inventory_adjustments', @level2type=N'COLUMN',@level2name=N'remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'inventory_adjustments', @level2type=N'COLUMN',@level2name=N'updated_at'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'inventory_adjustments', @level2type=N'COLUMN',@level2name=N'approval_status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Urban, Rural' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'location_types', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'location_types', @level2type=N'COLUMN',@level2name=N'updated_at'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'market_people', @level2type=N'COLUMN',@level2name=N'updated_at'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'markets', @level2type=N'COLUMN',@level2name=N'updated_at'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'measurement_units', @level2type=N'COLUMN',@level2name=N'updated_at'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'memos', @level2type=N'COLUMN',@level2name=N'sales_person_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0-Outlet, 1-CSA, 2-GDS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'memos', @level2type=N'COLUMN',@level2name=N'sales_to'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'if sold to CSA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'memos', @level2type=N'COLUMN',@level2name=N'csa_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'if adjustment needed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'memos', @level2type=N'COLUMN',@level2name=N'adjustment_amount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'reason for adjustment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'memos', @level2type=N'COLUMN',@level2name=N'adjustment_note'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'memos', @level2type=N'COLUMN',@level2name=N'collection_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'memos', @level2type=N'COLUMN',@level2name=N'credit_collected_amount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'memos', @level2type=N'COLUMN',@level2name=N'latitude'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'memos', @level2type=N'COLUMN',@level2name=N'longitude'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0= both, 1= ticker 2= inbox' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'message_lists', @level2type=N'COLUMN',@level2name=N'message_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'months', @level2type=N'COLUMN',@level2name=N'updated_at'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SalesHR' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'office_people', @level2type=N'COLUMN',@level2name=N'sales_person_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'office_people', @level2type=N'COLUMN',@level2name=N'updated_at'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HeadOffice, Regional Office, Area Sales Office, Central Warehouse' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'office_types', @level2type=N'COLUMN',@level2name=N'type_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'office_types', @level2type=N'COLUMN',@level2name=N'updated_at'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Refer to Office Type Table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'offices', @level2type=N'COLUMN',@level2name=N'office_type_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Self Join' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'offices', @level2type=N'COLUMN',@level2name=N'parent_office_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'offices', @level2type=N'COLUMN',@level2name=N'updated_at'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'outlet_categories', @level2type=N'COLUMN',@level2name=N'updated_at'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'outlet_ngo_prices', @level2type=N'COLUMN',@level2name=N'updated_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'outlet_ngo_prices', @level2type=N'COLUMN',@level2name=N'outlet_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'outlet_ngo_prices', @level2type=N'COLUMN',@level2name=N'type_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'outlets', @level2type=N'COLUMN',@level2name=N'updated_at'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'product_combinations', @level2type=N'COLUMN',@level2name=N'product_price_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0= indivisual, 1=total' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'product_combinations', @level2type=N'COLUMN',@level2name=N'indivisual_or_total'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'product_combinations', @level2type=N'COLUMN',@level2name=N'min_qty'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'product_combinations', @level2type=N'COLUMN',@level2name=N'parent_slab_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0-Pricing, 1- Promo, 2-Discount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'product_combinations', @level2type=N'COLUMN',@level2name=N'offer_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'product_combinations', @level2type=N'COLUMN',@level2name=N'effective_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'product_combinations', @level2type=N'COLUMN',@level2name=N'created_at'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'product_combinations', @level2type=N'COLUMN',@level2name=N'created_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'product_combinations', @level2type=N'COLUMN',@level2name=N'updated_at'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'product_combinations', @level2type=N'COLUMN',@level2name=N'updated_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1= p to p and 2= s to s' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'product_convert_history', @level2type=N'COLUMN',@level2name=N'type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'MeasuringUnits' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'product_measurements', @level2type=N'COLUMN',@level2name=N'measurement_unit_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'not needed for smc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'product_measurements', @level2type=N'COLUMN',@level2name=N'is_base'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'product_prices', @level2type=N'COLUMN',@level2name=N'vat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'product_prices', @level2type=N'COLUMN',@level2name=N'updated_at'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'product_prices', @level2type=N'COLUMN',@level2name=N'updated_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'product_prices', @level2type=N'COLUMN',@level2name=N'is_vat_applicable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'no need for sm' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'products', @level2type=N'COLUMN',@level2name=N'sub_category_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'gift item or promotion item not saleable' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'products', @level2type=N'COLUMN',@level2name=N'product_type_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'products', @level2type=N'COLUMN',@level2name=N'updated_at'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'products', @level2type=N'COLUMN',@level2name=N'updated_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'project_ngo_outlets', @level2type=N'COLUMN',@level2name=N'updated_at'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projects', @level2type=N'COLUMN',@level2name=N'updated_at'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=challan,2=requisition' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'reciever_office_person', @level2type=N'COLUMN',@level2name=N'receive_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'is it a requisition or a DO. For SMC only DO will be used.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'requisitions', @level2type=N'COLUMN',@level2name=N'is_do'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'is this requisition processed or not. 1/0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'requisitions', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'return_challan_details', @level2type=N'COLUMN',@level2name=N'expire_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'return_challan_details', @level2type=N'COLUMN',@level2name=N'remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'augenerate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'return_challans', @level2type=N'COLUMN',@level2name=N'challan_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0-ChallanFromCWH, 1-Issue to SO, 2-Transfer from ASO to ASO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'return_challans', @level2type=N'COLUMN',@level2name=N'challan_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'return_challans', @level2type=N'COLUMN',@level2name=N'remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'for SMC, CWH generated reference number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'return_challans', @level2type=N'COLUMN',@level2name=N'challan_referance_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'for SMC, DO number will be stored here if this challan is against a DO. If it is not against reuisition/DO then default value is 0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'return_challans', @level2type=N'COLUMN',@level2name=N'requisition_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Store ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'return_challans', @level2type=N'COLUMN',@level2name=N'sender_store_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TransactionTypes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'return_challans', @level2type=N'COLUMN',@level2name=N'transaction_type_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0=Pending,1=Received' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'return_challans', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Store ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'return_challans', @level2type=N'COLUMN',@level2name=N'receiver_store_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Office, Supplier, HR// Not needed for now. If future if needed we will use this' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'return_challans', @level2type=N'COLUMN',@level2name=N'receiver_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'return_challans', @level2type=N'COLUMN',@level2name=N'receiving_transaction_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'return_challans', @level2type=N'COLUMN',@level2name=N'received_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'return_challans', @level2type=N'COLUMN',@level2name=N'updated_at'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'return_challans', @level2type=N'COLUMN',@level2name=N'inventory_status_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=national target,2=area office target,3=so target' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sale_targets', @level2type=N'COLUMN',@level2name=N'target_category'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sale_targets', @level2type=N'COLUMN',@level2name=N'updated'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Parent HR ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sales_people', @level2type=N'COLUMN',@level2name=N'parent_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sales_people', @level2type=N'COLUMN',@level2name=N'updated_at'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=ASO Store, 2=SO Store ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'stores', @level2type=N'COLUMN',@level2name=N'store_type_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'store belongs to which office' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'stores', @level2type=N'COLUMN',@level2name=N'office_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'stores', @level2type=N'COLUMN',@level2name=N'updated_at'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0- Product Sales, 1- EC, 2- OC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'target_types', @level2type=N'COLUMN',@level2name=N'target_type_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'target_types', @level2type=N'COLUMN',@level2name=N'updated_at'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0-Year, 1-Month' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'targets', @level2type=N'COLUMN',@level2name=N'target_period_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'territories', @level2type=N'COLUMN',@level2name=N'updated_at'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'territory_people', @level2type=N'COLUMN',@level2name=N'updated_at'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'territory_people', @level2type=N'COLUMN',@level2name=N'updated_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'thanas', @level2type=N'COLUMN',@level2name=N'updated_at'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0=in,1=out' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'transaction_types', @level2type=N'COLUMN',@level2name=N'inout'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'transaction_types', @level2type=N'COLUMN',@level2name=N'updated_at'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variants', @level2type=N'COLUMN',@level2name=N'updated_at'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'weeks', @level2type=N'COLUMN',@level2name=N'updated_at'
GO
