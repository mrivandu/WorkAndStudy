select  sum(TranscribeAllSeconds) as '音频时长' from transcribe_logs where PodType = 'AsyncService' and TranscribeDay >= '2019-05-10';;
select  sum(TranscribeFrequency) as '转写成功量' from transcribe_logs where PodType = 'AsyncService' and TranscribeDay >= '2019-05-10';;
select  ifnull(sum(TranscribeFrequency),0) as '转写错误量'  from transcribe_logs where PodType = 'AsyncServerError' and TranscribeDay >= '2019-05-10';;
select  sum(TranscribeFrequency) as '转写量'  from transcribe_logs where (PodType = 'AsyncServerError' or PodType = 'AsyncService' ) and TranscribeDay >= '2019-05-10';;


-- select(select  sum(TranscribeFrequency) as '转写成功量' from transcribe_logs where PodType = 'AsyncService' and TranscribeDay >= '2019-05-10';)
-- /(select  sum(TranscribeFrequency) as '转写量'  from transcribe_logs where (PodType = 'AsyncServerError' or PodType = 'AsyncService' ) * 100 as '转写率' and TranscribeDay >= '2019-05-10';)

select(select  sum(TranscribeFrequency) as '转写成功量' from transcribe_logs where PodType = 'AsyncService' and TranscribeDay >= '2019-05-10')
/(select  sum(TranscribeFrequency) as '转写量'  from transcribe_logs where (PodType = 'AsyncServerError' or PodType = 'AsyncService' ) and TranscribeDay >= '2019-05-10') * 100 as '转写率';

select  ifnull(sum(TranscribeFrequency),0) as '转写错误量'  from transcribe_logs where PodType = 'AsyncServerError' and TranscribeDay = '2019-05-10';