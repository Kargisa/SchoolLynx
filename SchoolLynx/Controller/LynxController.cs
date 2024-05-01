using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SchoolLynx.Models;
using SchoolLynxLibrary.Models;

namespace SchoolLynx.Controller
{
    [Route("api/")]
    [ApiController]
    public class LynxController : ControllerBase
    {
        private readonly LynxContext _context;

        public LynxController(LynxContext context)
        {
            _context = context;
        }

        [HttpGet("persons")]
        public async Task<ActionResult<IEnumerable<Person>>> GetPersonsAsync([FromQuery] bool isteacher = true)
        {
            return Ok(_context.Persons.Where(p => p.Isteacher == isteacher).OrderBy(p => p.Lastname).ThenBy(p => p.Firstname));
        }

        [HttpGet("teachers/{teacherId}/messages")]
        public async Task<ActionResult<IEnumerable<Message>>> GetTeacherMessagesAsync(int teacherId)
        {
            return Ok(_context.Messages.Where(m => m.Sender!.Isteacher && m.Sender.Id == teacherId).Include(m => m.Confirmations)!.ThenInclude(c => c.Person));
        }

        [HttpGet("messages/{id}")]
        [ActionName("GetMessage")]
        public async Task<ActionResult<Message>> GetMessageAsync(int id)
        {
            Message? message = await _context.Messages.Include(m => m.Confirmations).ThenInclude(c => c.Person).FirstOrDefaultAsync(m => m.Id == id);
            if (message == null)
                return NotFound();
            return Ok(message);
        }

        [HttpPost("messages")]
        public async Task<ActionResult<Message>> PostMessageAsync([FromBody] Message message)
        {
            _context.Messages.Add(message);
            await _context.SaveChangesAsync();
            return CreatedAtAction("GetMessage", new { id = message.Id }, message);
        }

        [HttpPatch("messages/{id}")]
        public async Task<ActionResult> PatchMessageAsync(int id, [FromBody] PatchMessage? patchMessage)
        {
            if (patchMessage == null)
                return BadRequest();

            var message = await _context.Messages.FirstOrDefaultAsync(m => m.Id == id);
            if (message == null)
                return NotFound();

            message.Title = patchMessage.Title;
            message.Text = patchMessage.Text;
            message.SentOn = DateTime.UtcNow;

            await _context.SaveChangesAsync();
            return NoContent();
        }

        [HttpDelete("messages/{id}")]
        public async Task<ActionResult> DeleteMessage(int id)
        {
            var message = await _context.Messages.FirstOrDefaultAsync(m => m.Id == id);
            if (message == null)
                return NotFound();

            _context.Messages.Remove(message);
            await _context.SaveChangesAsync();

            return Ok();
        }

        [HttpGet("parents/{id}/messages")]
        public async Task<ActionResult<IEnumerable<Message>>> GetParentMessagesAsync(int id)
        {
            Person? parent = await _context.Persons.FirstOrDefaultAsync(p => !p.Isteacher && p.Id == id);
            if (parent == null)
                return NotFound();

            return Ok(_context.Messages.Where(m => m.ClassgroupId == parent.ClassgroupId).Include(m => m.Confirmations.Where(c => c.PersonId == id)));
        }

        [HttpPost("messages/{id}/confirmations")]
        public async Task<ActionResult> PostConfirmationAsync(int id, [FromBody] int personId)
        {
            Message? message = await _context.Messages.FirstOrDefaultAsync(m => m.Id == id);
            if (message == null)
                return NotFound();

            Person? person = await _context.Persons.FirstOrDefaultAsync(p => p.Id == personId);
            if (person == null)
                return BadRequest();

            var confirmation = new Confirmation()
            {
                MessageId = id,
                PersonId = personId,
                ConfirmedOn = DateTime.UtcNow,
            };
            _context.Confirmations.Add(confirmation);

            await _context.SaveChangesAsync();

            return CreatedAtAction("GetConfirmation", new { id = confirmation.Id }, confirmation);
        }

        [HttpGet("confirmations/{id}")]
        [ActionName("GetConfirmation")]
        public async Task<ActionResult<Confirmation>> GetConfirmationAsync(int id)
        {
            Confirmation? confirmation = await _context.Confirmations.FirstOrDefaultAsync(c => c.Id == id);
            if (confirmation == null)
                NotFound();

            return Ok(confirmation);
        }
    }
}
