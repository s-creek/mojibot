zoi_list = [ 'https://qiita-image-store.s3.amazonaws.com/0/29945/9e4bd52c-3fc3-a7c2-e8d2-b9911db5b5c8.png',
	 'https://pbs.twimg.com/media/CT5CwjsUAAAp87c.jpg',
	 'http://36.media.tumblr.com/0c83e92b656a22d69f117a62e8228ff5/tumblr_nbh5w2nG3J1tlrhf5o1_1280.png',
	 'http://cdn-ak.f.st-hatena.com/images/fotolife/y/yu_ki-dai/20140906/20140906194857.jpg',
	 'http://blog.oukasoft.com/wp-content/uploads/a9cd12eb83a391ed37528600a93afc8e.jpg',
	 'http://41.media.tumblr.com/6bb61086e953dd35cf79a40f3cd2926e/tumblr_n9jmsnzSBx1tgio5yo1_500.jpg',
	 'https://pbs.twimg.com/media/BvXux9OIEAAw2nq.jpg',
	 'http://blog-imgs-43.fc2.com/m/a/n/mangakikou/1419314850451.jpg',
	 'http://blog.oukasoft.com/wp-content/uploads/4472782f5c90597e55442b1a25414992.jpg',
	 'http://lohas.nicoseiga.jp/thumb/4302178i?1410606473',
	 'http://blog-imgs-66.fc2.com/p/s/o/pso2kumityo/zoi02.jpg',
	 'http://livedoor.4.blogimg.jp/jin115/imgs/a/f/afed00c3.jpg',
	 'http://38.media.tumblr.com/29446d67cef270e675c53e5bf4d9de71/tumblr_inline_ngihrjSlET1qz5zpg.jpg',
	 'https://pbs.twimg.com/media/BuR2wtpCMAM81Qf.jpg',
	 'https://pbs.twimg.com/media/BuR3gjFCYAAdFsw.jpg',
	 'http://cdn-ak.f.st-hatena.com/images/fotolife/a/aobagannbaruzoi/20150207/20150207151614.jpg',
	 'https://dignik.s3.amazonaws.com/uploads/image/file/753/Bt6ZRFnCIAMLmuN.jpg']

cron = require('cron').CronJob

module.exports = (robot) ->
  robot.hear /今日も一日/i, (msg) ->
    msg.send msg.random zoi_list


  new cron '0 30 10-23 * * *', () =>
    robot.send {room: "sasekazu"}, robot.Response::random zoi_list
  , null, true, "Asia/Tokyo"


  robot.respond /ぞい(リスト|りすと)/i, (msg) ->
    for zoi in zoi_list
      msg.send zoi