using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using WebAplicationForTeachers;
using WebAplicationForTeachers.Models;


namespace WebAplicationForTeachers.Controllers
{
    public class SheduleHoursSetsController : ApiController
    {
        private PupilBookEntities db = new PupilBookEntities();

        // GET: api/SheduleHoursSets
        public IQueryable<SheduleHoursSet> GetSheduleHoursSet()
        {
            return db.SheduleHoursSet;
        }

        // GET: api/SheduleHoursSets/5
        //[ResponseType(typeof(SheduleHoursSet))]
        //public IHttpActionResult GetSheduleHoursSet(int id)
        //{
        //    SheduleHoursSet sheduleHoursSet = db.SheduleHoursSet.Find(id);
        //    if (sheduleHoursSet == null)
        //    {
        //        return NotFound();
        //    }

        //    return Ok(sheduleHoursSet);
        //}
        [ResponseType(typeof(SheduleHoursSet))]
        public IHttpActionResult GetSheduleHoursSet(int id)
        {
            var sheduleHoursSet = from i in db.SheduleHoursSet
                                  where i.Shedule_Id == id
                                  select new { i.BeginTime, i.EndTime };
            if (sheduleHoursSet == null)
            {
                return NotFound();
            }
            List<SheduleHoursSetJson> items = new List<SheduleHoursSetJson>();
            foreach (var i in sheduleHoursSet)
            {
                SheduleHoursSetJson item = new SheduleHoursSetJson()
                {
                    start = i.BeginTime.ToString(),
                    end = i.EndTime.ToString()
                };
                items.Add(item);
            }

            return Ok(items);
        }

        // PUT: api/SheduleHoursSets/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutSheduleHoursSet(int id, SheduleHoursSet sheduleHoursSet)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != sheduleHoursSet.Id)
            {
                return BadRequest();
            }

            db.Entry(sheduleHoursSet).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!SheduleHoursSetExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/SheduleHoursSets
        [ResponseType(typeof(SheduleHoursSet))]
        public IHttpActionResult PostSheduleHoursSet(SheduleHoursSet sheduleHoursSet)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.SheduleHoursSet.Add(sheduleHoursSet);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = sheduleHoursSet.Id }, sheduleHoursSet);
        }

        // DELETE: api/SheduleHoursSets/5
        [ResponseType(typeof(SheduleHoursSet))]
        public IHttpActionResult DeleteSheduleHoursSet(int id)
        {
            SheduleHoursSet sheduleHoursSet = db.SheduleHoursSet.Find(id);
            if (sheduleHoursSet == null)
            {
                return NotFound();
            }

            db.SheduleHoursSet.Remove(sheduleHoursSet);
            db.SaveChanges();

            return Ok(sheduleHoursSet);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool SheduleHoursSetExists(int id)
        {
            return db.SheduleHoursSet.Count(e => e.Id == id) > 0;
        }
    }
}